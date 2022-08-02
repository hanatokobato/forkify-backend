class Mutations::CreateOrder < Mutations::BaseMutation
  argument :cart_id, Integer, required: true

  field :order, Types::OrderType

  def resolve(cart_id:)
    cart = context[:current_user].carts.find cart_id
    order = if (last_order = context[:current_user].orders.last) &&
      last_order.in_progress? &&
      cart.shopping_cart_items_equal_order_items?(last_order)
      last_order
    else
      create_order cart
    end

    { order: order }
  end

  private

  def create_order cart
    order = context[:current_user].orders.create!(
      number: Time.zone.now.to_i,
      ip_address: context[:request].env['REMOTE_ADDR'],
      bill_address: context[:current_user].billing_address
    )
    add_new_cart_items(order, cart.cart_items)
    order
  end

  def add_new_cart_items order, items
    items.each do |item|
      order.add_items(item.product, item.quantity)
    end
  end
end

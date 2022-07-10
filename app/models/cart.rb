# == Schema Information
#
# Table name: carts
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#
# Indexes
#
#  index_carts_on_user_id  (user_id)
#
class Cart < ActiveRecord::Base
  belongs_to  :user
  has_many    :cart_items

  def total_items
    cart_items.sum :quantity
  end

  def subtotal
    cart_items.map(&:total).sum
  end

  def line_items
    cart_items.order(:id).includes(product: :images).map do |item|
      {
        id: item.id,
        name: item.product.name,
        photo: item.product.images.first&.photo_link,
        quantity: item.quantity,
        line_total: item.total
      }
    end
  end

  def add_product product_id, qty = 1, cart_item_type_id = ItemType::SHOPPING_CART_ID
    product = Product.find_by(id: product_id)
    return if product.sold_out?

    items = cart_items.where(product_id: product_id).to_a
    add_cart_items items, qty, cart_item_type_id, product_id
  end

  def add_cart_items items, qty, cart_item_type_id, product_id
    if items.size < 1
      cart_item = cart_items.create(product_id:   product_id,
                                      user:         user,
                                      item_type_id: cart_item_type_id,
                                      quantity:     qty
                                    )
    else
      cart_item = items.first
      update_shopping_cart cart_item, qty
    end
    cart_item
  end

  def update_shopping_cart cart_item, qty = 1
    cart_item.update(quantity: (cart_item.quantity + qty))
    cart_item.destroy if cart_item.quantity <= 0
  end

  def remove_product(product_id)
    cart_items.find_by(product_id: product_id).destroy!
  end

  def shipping_options country_id, state_id = nil
    zones = ShippingZone.by_country country_id
    zones = zones.by_state(state_id) if state_id
    zones.includes(:shipping_rates).map do |zone|
      zone.shipping_rates.map do |rate|
        {
          shipping_rate_id: rate.id,
          description: "#{zone.name} - #{rate.name}",
          price: rate.amount
        }
      end
    end.flatten
  end

  def shopping_cart_items_equal_order_items? order
    product_ids_in_cart = []
    cart_items.each do |item|
      item.quantity.times do
        product_ids_in_cart.push(item.product_id)
      end
    end
    order_items = order.order_items.map(&:product_id)
    product_ids_in_cart.sort == order_items.sort
  end
end

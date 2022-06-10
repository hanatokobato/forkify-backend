class Mutations::UpdateCartQty < Mutations::BaseMutation
  argument :item_id, Integer, required: true
  argument :adjust_qty, Integer, required: true

  field :cart, Types::CartType, null: false
  field :errors, [String], null: false

  def resolve(item_id:, adjust_qty:)
    cart = context[:current_user].current_cart
    item = cart.cart_items.find item_id
    cart.update_shopping_cart(item, adjust_qty)

    {
      cart: cart.reload,
      errors: []
    }
  end
end

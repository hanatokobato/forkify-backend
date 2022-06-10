class Mutations::AddToCart < Mutations::BaseMutation
  argument :product_id, Integer, required: true

  field :cart, Types::CartType, null: false
  field :errors, [String], null: false

  def resolve(product_id:)
    cart = context[:current_user].current_cart

    if item = cart.add_product(product_id)
      {
        cart: cart.reload,
        errors: []
      }
    else
      {
        cart: nil,
        errors: item.errors.full_messages
      }
    end
  end
end

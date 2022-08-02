class Mutations::AddToCart < Mutations::BaseMutation
  argument :product_id, Integer, required: true

  field :cart, Types::CartType, null: false

  def resolve(product_id:)
    cart = context[:current_user].current_cart
    cart.add_product(product_id)

    { cart: cart.reload }
  end
end

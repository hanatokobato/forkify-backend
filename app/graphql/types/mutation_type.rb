module Types
  class MutationType < Types::BaseObject
    field :create_product, mutation: Mutations::CreateProduct
    field :update_product, mutation: Mutations::UpdateProduct
    field :delete_product, mutation: Mutations::DeleteProduct
    field :add_to_cart, mutation: Mutations::AddToCart
    field :update_cart_qty, mutation: Mutations::UpdateCartQty
  end
end

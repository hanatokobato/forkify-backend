module Types
  class MutationType < Types::BaseObject
    field :create_product, mutation: Mutations::CreateProduct
    field :delete_product, mutation: Mutations::DeleteProduct
  end
end

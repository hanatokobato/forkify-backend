module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    # /products
    field :products, [Types::ProductType]

    def products
      Product.all.includes(:images)
    end

    # /products/:id
    field :product, Types::ProductType do
      argument :id, ID
    end

    def product(id:)
      Product.find_by id: id
    end
  end
end

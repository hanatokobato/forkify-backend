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

    # /cart
    field :cart, Types::CartType do
      argument :user_id, Integer
    end

    def cart(user_id:)
      current_user.current_cart || current_user.carts.create!
    end

    # /shipping_options
    field :shipping_options, [Types::ShippingOptionType], null: false do
      argument :cart_id, Integer
      argument :country_id, Integer
      argument :state_id, Integer, required: false
    end

    def shipping_options(cart_id:, country_id:, state_id: nil)
      cart = Cart.find cart_id
      cart.shipping_options country_id, state_id
    end
  end
end

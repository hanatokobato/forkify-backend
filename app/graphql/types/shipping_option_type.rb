module Types
  class ShippingOptionType < Types::BaseObject
    field :shipping_rate_id, ID, null: false
    field :description, String
    field :price, Float
  end
end

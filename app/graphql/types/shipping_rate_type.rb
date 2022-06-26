# frozen_string_literal: true

module Types
  class ShippingRateType < Types::BaseObject
    field :id, ID, null: false
    field :name, String
    field :amount, Float
  end
end

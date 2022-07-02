# frozen_string_literal: true

module Types
  class ShippingZoneType < Types::BaseObject
    field :id, ID, null: false
    field :name, String
  end
end

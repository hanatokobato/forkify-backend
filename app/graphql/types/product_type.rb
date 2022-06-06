# frozen_string_literal: true

module Types
  class ProductType < Types::BaseObject
    field :id, ID, null: false
    field :name, String
    field :description, String
    field :price, Float
    field :quantity, Integer
    field :images, [ImageType]
  end
end

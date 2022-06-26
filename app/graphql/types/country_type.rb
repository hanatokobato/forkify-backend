# frozen_string_literal: true

module Types
  class CountryType < Types::BaseObject
    field :id, ID, null: false
    field :name, String
  end
end

module Types
  class LineItemType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :photo, String
    field :quantity, Integer, null: false
    field :line_total, Float, null: false
  end
end

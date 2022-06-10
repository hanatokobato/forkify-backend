module Types
  class CartType < Types::BaseObject
    field :id, Integer, null: false
    field :total_items, Integer, null: false
    field :subtotal, Float, null: false
    field :line_items, [LineItemType]
  end
end

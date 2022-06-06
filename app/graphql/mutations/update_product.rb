class Mutations::UpdateProduct < Mutations::BaseMutation
  argument :id, ID, required: true
  argument :name, String, required: true
  argument :description, String
  argument :price, Float
  argument :quantity, Integer
  argument :images, [Types::ImageInputType]

  field :product, Types::ProductType
  field :errors, [String], null: false

  def resolve(id:, name:, description:, price:, quantity: , images:)
    product = Product.find id

    if product.update name: name, description: description, price: price,
      quantity: quantity, images_attributes: images.map(&:to_h)
      {
        product: product,
        errors: []
      }
    else
      {
        product: nil,
        errors: product.errors.full_messages
      }
    end
  end
end

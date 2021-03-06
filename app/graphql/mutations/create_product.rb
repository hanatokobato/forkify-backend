class Mutations::CreateProduct < Mutations::BaseMutation
  argument :name, String, required: true
  argument :description, String
  argument :price, Float
  argument :quantity, Integer
  argument :images, [Types::ImageInputType]

  field :product, Types::ProductType
  field :errors, [String], null: false

  def resolve(name:, description:, price:, quantity: , images:)
    product = Product.new(name: name, description: description, price: price,
      quantity: quantity, images_attributes: images.map(&:to_h))

    if product.save
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

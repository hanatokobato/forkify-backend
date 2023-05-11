class Mutations::CreateProduct < Mutations::BaseMutation
  argument :name, String, required: true
  argument :description, String
  argument :price, Float
  argument :quantity, Integer
  argument :images, [Types::ImageInputType]

  field :product, Types::ProductType

  def resolve(name:, description:, price:, quantity: , images:)
    product = Product.new(name: name, description: description, price: price,
      quantity: quantity, images_attributes: images.map(&:to_h))
    product.save!

    { product: product }
  end
end

class Mutations::DeleteProduct < Mutations::BaseMutation
  argument :id, ID, required: true

  field :status, String

  def resolve(id:)
    product = Product.find id
    product.destroy!

    { status: :success }
  end
end

class Mutations::DeleteProduct < Mutations::BaseMutation
  argument :id, ID, required: true

  field :errors, [String], null: false

  def resolve(id:)
    product = Product.find_by id: id

    if product.present? && product.destroy
      {
        errors: []
      }
    else
      {
        errors: ['Delete failed!']
      }
    end
  end
end

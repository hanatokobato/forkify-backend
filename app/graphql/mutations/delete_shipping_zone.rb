class Mutations::DeleteShippingZone < Mutations::BaseMutation
  argument :id, ID, required: true

  field :status, String

  def resolve(id:)
    zone = ShippingZone.find id
    zone.destroy!

    { status: :success }
  end
end

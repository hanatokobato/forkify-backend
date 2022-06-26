class Mutations::DeleteShippingZone < Mutations::BaseMutation
  argument :id, ID, required: true

  field :id, ID, null: false
  field :errors, [String], null: false

  def resolve(id:)
    zone = ShippingZone.find id

    if zone.destroy
      {
        id: zone.id,
        errors: []
      }
    else
      {
        id: nil,
        errors: ['Delete failed!']
      }
    end
  end
end

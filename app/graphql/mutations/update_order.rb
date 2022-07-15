class Mutations::UpdateOrder < Mutations::BaseMutation
  argument :order_id, Integer, required: true
  argument :ship_address_id, Integer, required: false
  argument :bill_address_id, Integer, required: false

  field :order, Types::OrderType
  field :errors, [String]

  def resolve(order_id:, ship_address_id:, bill_address_id:)
    order = context[:current_user].orders.find order_id
    order.ship_address_id = ship_address_id if ship_address_id
    order.bill_address_id = bill_address_id if bill_address_id

    if order.save
      {
        order: order,
        errors: []
      }
    else
      {
        order: nil,
        errors: order.errors.full_messages
      }
    end
  end

  private
end

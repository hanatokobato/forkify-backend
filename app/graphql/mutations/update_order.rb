class Mutations::UpdateOrder < Mutations::BaseMutation
  argument :order_id, ID, required: true

  field :order, Types::OrderType
  field :errors, [String]

  def resolve(order_id:)
    order = context[:current_user].orders.find order_id
    order.ip_address = context[:request].remote_ip
  end

  private

end

class Mutations::CreateAddress < Mutations::BaseMutation
  argument :shopping_address_id, Integer, required: false
  argument :first_name, String, required: true
  argument :last_name, String, required: true
  argument :address1, String, required: true
  argument :city, String, required: true
  argument :state_id, Integer, required: true
  argument :zip_code, String, required: true
  argument :default, Boolean
  argument :country_id, Integer, required: true
  argument :order_id, Integer, required: false

  field :address, Types::AddressType

  def resolve(shopping_address_id:, first_name:, last_name:, address1:, city:, state_id:, zip_code:, default:, country_id:, order_id:)
    if shopping_address_id.present?
      address = context[:current_user].addresses.find shopping_address_id
    else
      address = context[:current_user].addresses.new(
        first_name: first_name,
        last_name: last_name,
        address1: address1,
        city: city,
        state_id: state_id,
        zip_code: zip_code,
        country_id: country_id
      )
      address.default = address.billing_default = true if default
      address.save!
    end
    update_order_address_id(address.id, order_id) if order_id.present?

    { address: address }
  end

  private

  def update_order_address_id address_id, order_id
    order = context[:current_user].orders.find order_id
    return unless order.in_progress?

    order.update!(
      ship_address_id: address_id,
      bill_address_id: address_id
    )
  end
end

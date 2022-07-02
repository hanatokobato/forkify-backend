class Mutations::SettingShippingZone < Mutations::BaseMutation
  argument :name, String, required: true
  argument :shipping_rates, [Types::ShippingRateInputType], required: true
  argument :country_ids, [Integer], required: true

  field :shipping_zone, Types::ShippingZoneType
  field :errors, [String], null: false

  def resolve(name:, shipping_rates:, country_ids:)
    zone_setting = Settings::ShippingZone.new name: name, country_ids: country_ids, shipping_rates: shipping_rates.map(&:to_h)
    shipping_zone = zone_setting.save
    if shipping_zone
      {
        shipping_zone: shipping_zone,
        errors: []
      }
    else
      {
        shipping_zone: nil,
        errors: zone_setting.errors.full_messages
      }
    end
  end
end

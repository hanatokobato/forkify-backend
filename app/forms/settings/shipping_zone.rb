class Settings::ShippingZone
  include ActiveModel::Model

  attr_accessor :name, :country_ids, :shipping_rates

  validates :name, presence: true
  validates :country_ids, presence: true
  validates :shipping_rates, presence: true
  validate :country_not_assigned

  def save
    return false unless valid?

    shipping_zone = nil
    ActiveRecord::Base.transaction do
      shipping_zone = ShippingZone.create!(
        name: name,
        shipping_rates_attributes: shipping_rates
      )
      assign_countries shipping_zone.id
    end

    shipping_zone
  rescue ActiveRecord::StatementInvalid => e
    errors.add(:base, e.message)

    false
  end

  private

  def assign_countries shipping_zone_id
    Country.where(id: country_ids).update_all shipping_zone_id: shipping_zone_id
  end

  def country_not_assigned
    return unless Country.where(id: country_ids).where.not(shipping_zone_id: nil).exists?

    errors.add(:country, "Has country already assigned")
  end
end

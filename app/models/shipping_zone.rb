# == Schema Information
#
# Table name: shipping_zones
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class ShippingZone < ApplicationRecord
  has_many :countries, dependent: :nullify
  has_many :states, dependent: :nullify
  has_many :shipping_rates, dependent: :destroy

  validates :name, presence: true, length: { maximum: 255 }

  accepts_nested_attributes_for :shipping_rates

  scope :by_country, -> (country_id) do
    joins(:countries).where(countries: { id: country_id })
  end

  scope :by_state, -> (state_id) do
    joins(:states).where(states: { id: state_id })
  end
end

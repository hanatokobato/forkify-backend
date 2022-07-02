# == Schema Information
#
# Table name: shipping_rates
#
#  id               :bigint           not null, primary key
#  amount           :decimal(8, 2)    default(0.0), not null
#  name             :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  shipping_zone_id :bigint
#
class ShippingRate < ApplicationRecord
  include ActionView::Helpers::NumberHelper

  belongs_to :shipping_zone
  has_many :products

  validates :name, presence: true
  validates :amount, presence: true, numericality: true

  def name_with_rate
    [name, amount].compact.join ' - '
  end

  private
    def charge_amount
      number_to_currency rate
    end
end

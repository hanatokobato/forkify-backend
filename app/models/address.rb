# == Schema Information
#
# Table name: addresses
#
#  id                 :bigint           not null, primary key
#  address1           :string
#  address_type       :integer
#  addressable_type   :string
#  city               :string
#  first_name         :string
#  is_billing_default :boolean          default(FALSE)
#  is_default         :boolean          default(FALSE)
#  last_name          :string
#  zip_code           :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  addressable_id     :integer
#  country_id         :integer
#  state_id           :integer
#
# Indexes
#
#  index_addresses_on_addressable_id    (addressable_id)
#  index_addresses_on_addressable_type  (addressable_type)
#  index_addresses_on_country_id        (country_id)
#  index_addresses_on_state_id          (state_id)
#
class Address < ApplicationRecord
  belongs_to :state
  belongs_to :country
  belongs_to :addressable, polymorphic: true
end

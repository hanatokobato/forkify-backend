# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  email      :string
#  name       :string
#  nickname   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  auth0_id   :string
#
# Indexes
#
#  uniq_auth0_user  (auth0_id) UNIQUE
#
class User < ApplicationRecord
  has_many :recipes
  has_many :recipe_bookmarks
  has_many :bookmarked_recipes, through: :recipe_bookmarks, source: :recipe
  has_many :carts, dependent: :destroy
  has_many :orders
  has_many :addresses, dependent: :destroy, as: :addressable
  has_one :default_billing_address, -> { where(is_billing_default: true) },
    as: :addressable, class_name: Address.name
  has_one :default_shipping_address,  -> { where(is_default: true) },
    as: :addressable, class_name: Address.name

  def current_cart
    carts.last
  end

  def billing_address
    default_billing_address ? default_billing_address : shipping_address
  end

  def shipping_address
    default_shipping_address ? default_shipping_address : addresses.first
  end
end

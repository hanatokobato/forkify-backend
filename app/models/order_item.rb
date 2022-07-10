# == Schema Information
#
# Table name: order_items
#
#  id               :bigint           not null, primary key
#  price            :decimal(8, 2)
#  state            :string
#  total            :decimal(8, 2)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  order_id         :integer
#  product_id       :integer
#  shipping_rate_id :integer
#
# Indexes
#
#  index_order_items_on_order_id          (order_id)
#  index_order_items_on_product_id        (product_id)
#  index_order_items_on_shipping_rate_id  (shipping_rate_id)
#
class OrderItem < ApplicationRecord
  include AASM

  belongs_to :order
  belongs_to :shipping_rate, optional: true
  belongs_to :product
end

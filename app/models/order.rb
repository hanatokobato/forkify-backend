# == Schema Information
#
# Table name: orders
#
#  id              :bigint           not null, primary key
#  calculated_at   :datetime
#  completed_at    :datetime
#  email           :string
#  ip_address      :string
#  number          :string
#  shipped         :boolean          default(FALSE)
#  state           :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  bill_address_id :integer
#  ship_address_id :integer
#  user_id         :integer
#
# Indexes
#
#  index_orders_on_bill_address_id  (bill_address_id)
#  index_orders_on_email            (email)
#  index_orders_on_number           (number)
#  index_orders_on_ship_address_id  (ship_address_id)
#
class Order < ApplicationRecord
  include AASM
  extend FriendlyId

  friendly_id :number

  has_many :order_items, dependent: :destroy

  belongs_to :user
  belongs_to :ship_address, class_name: Address.name, optional: true
  belongs_to :bill_address, class_name: Address.name, optional: true

  aasm column: :state do
    state :in_progress, initial: true
    state :complete
    state :paid
    state :canceled

    event :complete do
      transitions to: :complete, from: :in_progress
    end

    event :pay, after: :mark_items_paid do
      transitions to: :paid, from: [:in_progress, :complete]
    end
  end

  def add_items(product, quantity)
    save! if new_record?
    quantity.times do
      order_items.create!(product_id: product.id, price: product.price)
    end
  end
end

# == Schema Information
#
# Table name: products
#
#  id              :bigint           not null, primary key
#  description     :text
#  featured        :boolean
#  name            :string
#  old_price       :decimal(, )
#  on_sale         :boolean
#  price           :decimal(8, 2)
#  quantity        :integer
#  sold_out        :boolean
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  product_type_id :integer
#
class Product < ApplicationRecord
  belongs_to :product_type, optional: true
  has_many :images, as: :imageable, dependent: :destroy
  has_many :active_variants, -> { where(deleted_at: nil) }, class_name: 'Variant'

  accepts_nested_attributes_for :images, reject_if: proc { |t| (t['photo_link'].nil?) }, allow_destroy: true

  validates :name, presence: true
  validates :price, presence: true
  validates :quantity, presence: true, :inclusion => 1..999
end

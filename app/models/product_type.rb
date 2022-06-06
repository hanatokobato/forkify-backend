# == Schema Information
#
# Table name: product_types
#
#  id         :bigint           not null, primary key
#  active     :boolean          default(TRUE)
#  lft        :integer
#  name       :string
#  rgt        :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  parent_id  :integer
#
# Indexes
#
#  index_product_types_on_lft  (lft)
#  index_product_types_on_rgt  (rgt)
#
class ProductType < ApplicationRecord
  acts_as_nested_set
  has_many :products, dependent: :restrict_with_exception

  validates :name,    presence: true, length: { :maximum => 255 }
end

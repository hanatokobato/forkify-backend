# == Schema Information
#
# Table name: item_types
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class ItemType < ActiveRecord::Base
  has_many :carts

  SHOPPING_CART   = 'shopping_cart'
  SAVE_FOR_LATER  = 'save_for_later'
  WISH_LIST       = 'wish_list'
  PURCHASED       = 'purchased'
  NAMES = [SHOPPING_CART, SAVE_FOR_LATER, WISH_LIST, PURCHASED]


  SHOPPING_CART_ID   = 1
  SAVE_FOR_LATER_ID  = 2
  WISH_LIST_ID       = 3
  PURCHASED_ID       = 4

  validates :name,        :presence => true

end

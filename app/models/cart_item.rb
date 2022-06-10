# == Schema Information
#
# Table name: cart_items
#
#  id           :bigint           not null, primary key
#  active       :boolean          default(TRUE)
#  quantity     :integer          default(1)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  cart_id      :integer
#  item_type_id :integer          not null
#  product_id   :integer
#  user_id      :integer
#
class CartItem < ActiveRecord::Base
  belongs_to :item_type
  belongs_to :user
  belongs_to :cart
  belongs_to :product

  def price
    product.price
  end

  def total
    price * quantity
  end

  def shopping_cart_item?
    item_type_id == ItemType::SHOPPING_CART_ID
  end
end

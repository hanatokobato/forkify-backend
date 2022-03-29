# == Schema Information
#
# Table name: recipes
#
#  id           :bigint           not null, primary key
#  cooking_time :string
#  image_url    :string
#  publisher    :string
#  servings     :integer
#  source_url   :string
#  title        :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Recipe < ApplicationRecord
  has_many :ingredients

  accepts_nested_attributes_for :ingredients
end

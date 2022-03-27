# == Schema Information
#
# Table name: recipes
#
#  id           :bigint           not null, primary key
#  cooking_time :string
#  image        :string
#  ingredients  :text
#  publisher    :string
#  servings     :integer
#  source_url   :string
#  title        :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Recipe < ApplicationRecord
end

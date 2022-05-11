# == Schema Information
#
# Table name: recipe_bookmarks
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  recipe_id  :bigint
#  user_id    :bigint
#
# Indexes
#
#  index_recipe_bookmarks_on_recipe_id  (recipe_id)
#  index_recipe_bookmarks_on_user_id    (user_id)
#
class RecipeBookmark < ApplicationRecord
  belongs_to :user
  belongs_to :recipe
end

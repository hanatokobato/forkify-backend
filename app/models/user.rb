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
end

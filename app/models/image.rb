# == Schema Information
#
# Table name: images
#
#  id             :bigint           not null, primary key
#  caption        :string
#  imageable_type :string
#  photo_link     :string
#  position       :integer
#  imageable_id   :integer
#
# Indexes
#
#  index_images_on_imageable_id    (imageable_id)
#  index_images_on_imageable_type  (imageable_type)
#  index_images_on_position        (position)
#

class Image < ApplicationRecord
  belongs_to :imageable, :polymorphic => true, inverse_of: :imageable

  has_one_attached :photo

  # validates :imageable_type,  presence: true
  # validates :imageable_id,    presence: true

  default_scope -> { order('position') }

  MAIN_LOGO = 'logo'

  def image_height
    photo&.metadata['height']
  end

  def image_width
    photo&.metadata['width']
  end
end

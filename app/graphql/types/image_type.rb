module Types
  class ImageType < Types::BaseObject
    field :id, ID, null: false
    field :photo_link, String, null: false
  end
end

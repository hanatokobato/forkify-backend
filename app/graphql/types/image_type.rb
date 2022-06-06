module Types
  class ImageType < Types::BaseObject
    field :id, ID, null: false
    field :photo_link, String
  end
end

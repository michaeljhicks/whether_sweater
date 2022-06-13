class PhotoSerializer
  include JSONAPI::Serializer

  set_id :id 
  set_type "image"

  attributes :image, :credits
end
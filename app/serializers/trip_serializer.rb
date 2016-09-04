class TripSerializer < ActiveModel::Serializer
  attributes :id, :title, :description
  # maybe nest objectives under here
end

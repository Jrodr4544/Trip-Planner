
class Objective < ActiveRecord::Base
  # include Geokit::Geocoders
  validates :title,   presence: true
  belongs_to :trip
  belongs_to :location

  # after_create :create_location

  # def create_location
  #   place = Geokit::Geocoders::GoogleGeocoder.geocode(to_addr)
  #   Location.create(lat: place.lat,lng: place.lng)
  #   Location.last.save
  #   self.update(location_id: Location.last.id)
  # end

  # def to_addr
  #   "#{self.city}" + ", #{self.state}" + ", #{self.country}"
  # end                  
end
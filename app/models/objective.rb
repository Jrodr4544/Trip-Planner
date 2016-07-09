
class Objective < ActiveRecord::Base
  include Geokit::Geocoders

  belongs_to :trip
  # acts_as_mappable  :auto_geocode => true
  after_create :get_location


  def get_location
    place = Geokit::Geocoders::GoogleGeocoder.geocode(to_addr)
    self.update(lat: place.lat,lng: place.lng)
  end

  def to_addr
    "#{self.city}" + ", #{self.state}" + ", #{self.country}"
  end                  
end
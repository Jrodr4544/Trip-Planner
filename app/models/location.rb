class Location < ActiveRecord::Base
has_many :objectives
has_many :trips, through: :objectives
validates :city,    presence: true 
validates :country, presence: true
validates :state,   presence: true

include Geokit::Geocoders
after_create :set_location

  def set_location
    place = Geokit::Geocoders::GoogleGeocoder.geocode(to_addr)
    self.update(lat: place.lat,lng: place.lng)
  end

  def to_addr
    "#{self.city}" + ", #{self.state}" + ", #{self.country}"
  end

end
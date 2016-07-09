
class Objective < ActiveRecord::Base
  include Geokit::Geocoders
  validates :title,   presence: true
  validates :city,    presence: true 
  validates :country, presence: true
  validates :state,   presence: true
  belongs_to :trip
  after_create :get_location


  def get_location
    place = Geokit::Geocoders::GoogleGeocoder.geocode(to_addr)
    self.update(lat: place.lat,lng: place.lng)
  end

  def to_addr
    "#{self.city}" + ", #{self.state}" + ", #{self.country}"
  end                  
end
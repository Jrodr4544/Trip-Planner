class Objective < ActiveRecord::Base

  belongs_to :trip
  acts_as_mappable
  before_validation :geocode_location, :on => :create

# All classes are called using the following signature:

# include Geokit::Geocoders
# location = XxxGeocoder.geocode(address)

  private

    def geocode_location
      geo=Geokit::Geocoders::MultiGeocoder.geocode (self.to_addr)
      errors.add(:address, "Could not Geocode address") if !geo.success
      self.lat, self.lng = geo.lat,geo.lng if geo.success
    end

    def to_addr
      self.city + self.state + self.country
    end
end
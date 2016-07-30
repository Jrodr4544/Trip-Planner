class Location < ActiveRecord::Base
has_many :objectives
has_many :trips, through: :objectives
validates :city,    presence: true 
validates :country, presence: true
validates :state,   presence: true

end
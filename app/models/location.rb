class Location < ActiveRecord::Base
has_many :objectives
has_many :trips, through: :objectives

end
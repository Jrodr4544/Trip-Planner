class Objective < ActiveRecord::Base
  validates :title,   presence: true
  belongs_to :trip
  belongs_to :location
             
end
class Objective < ActiveRecord::Base

  belongs_to :trip
  acts_as_mappable :auto_geocode=>{:field=>:city, :error_message=>'Could not geocode address'}
end
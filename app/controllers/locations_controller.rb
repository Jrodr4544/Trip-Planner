class LocationsController < ApplicationController

  def index
    @locations = current_user.objectives.map { |objective| objective.trip.locations }.flatten 
  end

end

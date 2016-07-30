class LocationsController < ApplicationController

  def index
    @locations = current_user.objectives.map { |objective| objective.trip.locations }.flatten 
  end

  def new
    @location = Location.new
  end


end

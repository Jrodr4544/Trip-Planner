class LocationsController < ApplicationController

  def index
    @locations = current_user.objectives.map { |objective| objective.trip.locations }.flatten 
  end

  def new
    @location = Location.new
  end

  def create
    @location = Location.create(location_params)

    if @location.save
      redirect_to '/trips', notice: 'Location was successfully created.'
    else
      render :new
    end
  end

  private

    def location_params
      params.require(:location).permit(:title, :city, :state, :country)
    end

end

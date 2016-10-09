class LocationsController < ApplicationController

  def index
    @locations = Location.all
    respond_to do |format|
      format.html { render :index }
      format.json { render json: @locations, root: true}
    end
  end

  def new
    @location = Location.new
  end

  def create
    @location = Location.create(location_params)

    if @location.save
      redirect_to '/', notice: 'Location was successfully created.'
    else
      render :new
    end
  end

  def destroy
    @location = Location.find(params["id"])
    @location.destroy
    redirect_to locations_path
  end

  private

    def location_params
      params.require(:location).permit(:title, :city, :state, :country)
    end

end

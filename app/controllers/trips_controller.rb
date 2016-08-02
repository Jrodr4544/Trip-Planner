class TripsController < ApplicationController
  before_action :set_trip, only: [:show, :edit, :update, :destroy]

  def index
    if current_user
      @trips = current_user.trips 
      redirect_to '/trips/new' if @trips.blank? 
    else
      redirect_to root_path
    end
  end

  def show
    # gon.googleMapsApi = "AIzaSyC6bIdRiDEVfRxawlb_b2-VUwhdrNy7ZZA"
    # @key = gon.googleMapsApi
    @locations = []
    @trip.locations.map {|location| @locations << {lat: location.lat,lng: location.lng} if location.lat || location.lng }.compact
  end

  def new
    @trip = Trip.new
    @trip.objectives.build
  end

  def create
    @trip = Trip.create(title: trip_params["title"], description: trip_params["description"])
    @trip.objectives.build(trip_params["objectives"])
    current_user.trips << @trip
    if @trip.save
      redirect_to @trip, notice: 'Trip was successfully created.'
    else
      render :new
    end
  end

  def edit

  end

  def update
    if @trip.update(trip_params)
      redirect_to '/trips', notice: 'Objective was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
  end

  private

    def set_trip
      @trip = Trip.find(params[:id])
    end

    def trip_params
      params.require(:trip).permit(:title, :description, :objectives => [:title, :notes, :location_id])
    end

end
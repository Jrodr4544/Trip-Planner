class TripsController < ApplicationController
  before_action :set_trip, only: [:show, :edit, :update, :destroy]

  def index
    @trips = current_user.trips 
    redirect_to '/trips/new' if @trips.blank?
  end

  def show
    @locations = @trip.objectives.map {|objective| "#{objective.lat}, "+"#{objective.lng}" if !objective.lat && !objective.lng }
  end

  def new
    @trip = Trip.new
    @objective = @trip.objectives.new
  end

  def create
    @trip = Trip.create(trip_params)
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
      params.require(:trip).permit(:title, :description)
    end

end
class TripsController < ApplicationController
  before_action :set_trip, only: [:show, :edit, :update, :destroy, :state]

  def index
    if current_user
      @trips = current_user.trips 
      respond_to do |format|
        format.html { render :show }
        format.json { render json: @trips, root: true}
      end
      redirect_to '/trips/new' if @trips.blank? 
    else
      redirect_to root_path
    end
  end

  def show
    @locations = []
    @sortedObjectives = []
    @states           = []

    @trip.locations.map {|location| @locations << {lat: location.lat,lng: location.lng} if location.lat || location.lng }.compact
    @sortedObjectives = @trip.objectives.sort_by {|objective| objective.location[:state]}

    # every duplicate state will be nil
    @sortedObjectives.each do |objective|
      if !@states.include?(objective.location[:state])
        @states << objective.location[:state]
      else
        @states << nil
      end
    end

    respond_to do |format|
      format.html { render :show }
      format.json { render json: @sortedObjectives, root: true}
    end
  end

  def state
    # this action is used to render JSON objects by state
    @sortedObjectives = []
    if current_user
      @sortedObjectives = @trip.objectives.select {|objective| objective.location[:state] == params[:state]}
        render json: @sortedObjectives, root: true
    else
      redirect_to root_path
    end
  end

  def new
    @trip = Trip.new
    @trip.objectives.build
  end

  def create
    @trip      = current_user.trips.create(title: trip_params["title"], description: trip_params["description"])
    @trip.objectives_attributes = trip_params["objectives_attributes"] 
       
    if @trip.save
      redirect_to '/trips', notice: 'Trip was successfully created.'
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
    if current_user
      @trip.destroy
      redirect_to trips_path
    end
  end

  private

    def set_trip
      @trip = Trip.find(params[:id])
    end

    def trip_params
      params.require(:trip).permit(:title, :description, :objectives_attributes => [:title, :notes, :location_id])
    end

end
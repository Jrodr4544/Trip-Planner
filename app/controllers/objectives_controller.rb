class ObjectivesController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_trip, only: [:index, :show, :create, :edit, :update, :destroy]

  def index
    @objectives = @trip.objectives
  end

  def show
    @objective = @trip.objectives.find(params[:id])

    respond_to do |format|
      format.html { render :show }
      format.json { render json: @objective }
    end
  end

  def new
    @objective = Objective.new
  end

  def create
    @objective = Objective.create(objective_params)

    if @objective.save
      flash.now[:notice] = 'Objective was successfully created.'
    else
      render :new
    end
  end

  def edit
    @objective = Objective.find(params[:id])
  end

  def update
    @objective = @trip.objectives.find(params[:id])

    if @objective.update(objective_params)
      redirect_to user_path(current_user), notice: 'Objective was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @objective = @trip.objectives.find(params[:id])
    @objective.destroy
    redirect_to user_path(current_user)
  end

  private

    def set_trip
      if params[:trip_id] 
        @trip = Trip.find(params[:trip_id]) 
      elsif params["objective"]["trip_id"]
        @trip = Trip.find(params["objective"]["trip_id"])
      else
        @trip = Objective.find(params[:id]).trip
      end
    end

    def objective_params
      params.require(:objective).permit(:title, :city, :state, :country, :notes, :trip_id, :location_id)
    end

end
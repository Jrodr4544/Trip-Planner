class ObjectivesController < ApplicationController
  before_action :set_objective, only: [:edit, :update, :destroy]

  def index
  end

  def show
  end

  def new
    @objective = Objective.new
  end

  def create
     @objective = Objective.create(objective_params)

    if @objective.save
      redirect_to '/trips', notice: 'Objective was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @objective.update(objective_params)
      redirect_to '/trips', notice: 'Objective was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
  end

  private

    def set_objective
      @objective = Objective.find(params[:id])
    end

    def objective_params
      params.require(:objective).permit(:title, :city, :state, :country, :notes, :trip_id)
    end

end
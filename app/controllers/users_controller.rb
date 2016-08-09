class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @trips = current_user.trips
  end

end
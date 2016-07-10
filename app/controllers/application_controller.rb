class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # Adding this will allow strong parameters to devise_controller
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

    def configure_permitted_parameters
    # allowing name parameter to devise users
      devise_parameter_sanitizer.for(:sign_up) << :name
    end
end


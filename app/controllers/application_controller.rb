class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # Adding this will allow strong parameters to devise_controller
  before_action :configure_permitted_parameters, if: :devise_controller?

  # This will give 404 page when record is not found
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  # Redirecting to sign in after sign out
  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path 
  end

  protected

    def configure_permitted_parameters
    # allowing name parameter to devise users
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    end

    def record_not_found
      render :file => "#{Rails.root}/public/404"
    end
end


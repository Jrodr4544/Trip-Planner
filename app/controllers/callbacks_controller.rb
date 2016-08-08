class CallbacksController < Devise::OmniauthCallbacksController
  # facebook callback when a user signs in
  def facebook
      @user = User.from_omniauth(request.env["omniauth.auth"])
      sign_in_and_redirect @user
  end
end
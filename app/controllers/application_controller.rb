class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:visa, :admin])
    devise_parameter_sanitizer.permit(:account_update, keys: [:admin, :visa, :email, :password, :current_password])
  end
end

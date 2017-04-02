class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    dashboard_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :email, :password, :password_confirmation, :remember_me, :avatar, :avatar_cache, :to_dash])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username, :password, :password_confirmation, :current_password, :avatar, :to_dash])
  end
end

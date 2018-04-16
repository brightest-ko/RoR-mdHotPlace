class ApplicationController < ActionController::Base
  
  protect_from_forgery with: :null_sessions

  before_action :configure_permitted_parameters, if: :devise_controller?
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :user_delete, :level, :user_id, :user_name, :phone])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:email, :user_delete, :level, :user_id, :user_name, :phone])
  end

end

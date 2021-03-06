class ApplicationController < ActionController::Base
  
  # before_action :authenticate_user!, only[:new, :edit, :update, :destroy]
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :null_session
  
  def after_sign_in_path_for(resource)
    '/'
  end
  
  def after_sign_out_path_for(resource)
    '/users/sign_in'
  end
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :image])
    devise_parameter_sanitizer.permit(:account_update, keys: [:nickname, :image])
  end
end

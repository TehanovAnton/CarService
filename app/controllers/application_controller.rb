# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :requier_login, unless: :devise_controller?  

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:first_name, :last_name, :email, :password, :phone_number, :type) }
  end

  private
  
  def requier_login
    redirect_to new_user_session_path unless current_user
  end
end

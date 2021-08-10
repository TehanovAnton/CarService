# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :check_inputs, if: :devise_controller?
  before_action :requier_login, unless: :devise_controller?

  before_action :check_email_message, if: :devise_controller?

  unless Rails.application.config.consider_all_requests_local
    rescue_from ActionController::RoutingError, with: -> { render_404 }     
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:first_name, :last_name, :email, :password, :phone_number, :type) }
  end

  private
  
  def requier_login
    redirect_to new_user_session_path unless current_user
  end

  def check_inputs
    new_sessions = post_with_user_params? && params[:controller] == 'devise/sessions'

    user = User.find_by(email: new_session_inputs[:email]) if new_sessions
    load_sign_in('wrong email') if new_sessions && !user 
  end

  def check_email_message
    new_registration = post_with_user_params? && params[:controller] == 'devise/registrations'
    params[:message] = 'check your email' if new_registration
  end

  def new_session_inputs
    params.require(:user).permit(:email, :password)
  end

  def post_with_user_params?
    request.post? && params.keys.include?('user')
  end

  def load_sign_in(message)
    redirect_to new_user_session_path(message: message)
  end

  def reload_sign_up(message)
    # puts "messsage #{message} ..."
    redirect_to new_user_registration_path(error_message: message)
  end

  def render_404
    respond_to do |format|
      format.html { render template: 'errors/not_found', status: 404 }
      format.all { render nothing: true, status: 404 }
    end
  end
end

# frozen_string_literal: true

class ApplicationController < ActionController::Base
  Constants = {
    registrations: 'devise/registrations',
    sessions: 'devise/sessions',
    new_action: 'new',
    users: 'users',
    users_guest_action: 'guest'
  }

  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :requier_login, unless: :devise_controller?
  before_action :check_sessions_inputs, if: :devise_controller?
  before_action :check_registrations_inputs, if: :devise_controller?
  before_action :guest_only_for_unauthorized

  unless Rails.application.config.consider_all_requests_local
    rescue_from ActionController::RoutingError, with: -> { render_404 }
  end

  def self.sign?(params)
    controller = params[:controller]
    action = params[:action]
    logger.info("Controlle#action : #{controller}##{action}")
    Constants.values.include?(controller) && Constants.values.include?(action)
  end

  def self.guest?(params)
    Constants.values.include?(params[:controller]) && Constants.values.include?(params[:action])
  end

  def self.authorized?
    current_user
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:first_name, :last_name, :email, :password, :phone_number, :type) }
  end

  private

  def guest_only_for_unauthorized
    redirect_to users_path if params[:action] == Constants[:users_guest_action] && current_user
  end
  
  def requier_login
    redirect_to new_user_session_path unless current_user
  end

  def check_sessions_inputs
    new_sessions = post_with_user_params? && params[:controller] == 'devise/sessions'

    user = User.find_by(email: new_session_inputs[:email]) if new_sessions
    load_sign_in('wrong email') if new_sessions && !user
  end

  def check_registrations_inputs 
    new_registration = post_with_user_params? && params[:controller] == 'devise/registrations'
    user = User.find_by(email: new_registration_inputs[:email]) if new_registration
    logger.info("filter !!! #{user.id}") if user
    load_sign_up('this email already exists') if user
  end

  def new_session_inputs
    params.require(:user).permit(:email, :password)
  end

  def new_registration_inputs
    params.require(:user).permit(:email, :password)
  end

  def post_with_user_params?
    request.post? && params.keys.include?('user')
  end

  def load_sign_in(message)
    redirect_to new_user_session_path, alert: message
  end

  def load_sign_up(message)
    redirect_to new_user_registration_path, alert: message
  end

  def render_404
    respond_to do |format|
      format.html { render template: 'errors/not_found', status: 404 }
      format.all { render nothing: true, status: 404 }
    end
  end
end

class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :permitted_parameters, if: :devise_controller?

  def after_sign_out_path_for(_resource_or_scope)
    request.referrer
    '/users/sign_in'
  end

  protected

  def permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |user|
      user.permit(:name, :bio, :email, :password, :password_confirmation)
    end

    devise_parameter_sanitizer.permit(:account_update) do |user|
      user.permit(:name, :photo, :bio, :email, :password, :password_confirmation, :current_password)
    end
  end
end

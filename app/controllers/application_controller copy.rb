class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  protect_from_forgery with: :exception
  before_action :update_allowed_parameters, if: :devise_controller?

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |field|
      field.permit(:name, :photo, :bio, :posts_counter, :email, :password, :password_confirmation)
    end
  end
end

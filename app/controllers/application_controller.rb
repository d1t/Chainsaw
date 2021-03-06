class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) do |u|
      u.permit(
        :email, :password, :password_confirmation, :username,
        store_attributes: [:image, :image_cache, :brand_bio]
      )
    end
    devise_parameter_sanitizer.for(:account_update) do |u|
      u.permit(
        :email, :password, :password_confirmation, :current_password, :username,
        store_attributes: [:id, :image, :image_cache, :brand_bio, :remove_image, :brand_name]
      )
    end
  end

end

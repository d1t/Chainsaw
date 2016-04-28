class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  after_filter :store_location


  def store_location
    # store last url - this is needed for post-login redirect to whatever the user last visited.
    return unless request.get? 
    if (request.path != "/users/sign_in" &&
        request.path != "/users/sign_up" &&
        request.path != "/users/password/new" &&
        request.path != "/users/password/edit" &&
        request.path != "/users/confirmation" &&
        request.path != "/users/sign_out" &&
        !request.xhr?) # don't store ajax calls
      session[:previous_url] = request.fullpath 
    end
  end

  def after_sign_in_path_for(resource)
    resource.add_products_from_session session[:cart_id]
    if resource.customer?
      session[:previous_url] || customer_partners_path
    else
      session[:previous_url] || edit_user_registration_path
    end
  end

  protected

  
    def current_cart
      Cart.find(session[:cart_id])
      rescue ActiveRecord::RecordNotFound
        cart = Cart.create
        session[:cart_id] = cart.id
        return cart # this will get returned
      end


  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) do |u|
      u.permit(
        :email, :password, :password_confirmation, :username, :role
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

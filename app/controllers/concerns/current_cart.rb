module CurrentCart
  extend ActiveSupport::Concern

  private

    def set_cart
      @cart = if current_user
        current_user.cart
      elsif session[:cart_id]
        Cart.find(session[:cart_id])
      else
        @cart = Cart.create
        session[:cart_id] = @cart.id
        @cart
      end
      rescue ActiveRecord::RecordNotFound
    end
    
end
class Customer::CartsController < ApplicationController
  def show
    @cart = if current_user
      current_user.cart
    else
      Cart.find session[:cart_id]
    end
  end
end

class CartController < ApplicationController
  def add
  		id = params[:id]
		# if the cart has already been created, use the existing cart. Else create a new cart
	 if session[:cart] then
		cart = session[:cart]
	 else
	 	session[:cart] ={}
	 	cart = session[:cart]
 end
	# if the product has already been added to the cart, increase the value already in the cart
	if cart[id] then
		cart[id] = cart[id] + 1
	else
		cart[id] = 1
	end
	redirect_to :action => :index
	end #end add method

  def clearCart
  	session[:cart] = nil
	redirect_to :action => :index
  end

  def index
	  		# if there is a cart, pass it to the page for display, else pass an empty value
	  if session[:cart] then
	  	@cart = session[:cart]
	  else
	  	@cart = {}
	  end
  end
end

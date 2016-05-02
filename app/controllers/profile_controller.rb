class ProfileController < ApplicationController
	skip_before_action :authorize, only: :show

  def show
    @partner = User.find_by(username: params[:username])
    @products = Product.find_by(params[:id])
    @products = @partner.products
    store = Store.find_by(params[:id])
    @partner.store = @partner.store 
  end

end
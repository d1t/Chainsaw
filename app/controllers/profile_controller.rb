class ProfileController < ApplicationController
<<<<<<< HEAD
	skip_before_action :authorize, only: :show	
  def show
  @partners = Partner.find_by_username(params[:username])
  @products = Product.find_by(params[:id])
  end
=======

  def show
  end

>>>>>>> 635a7b70783a009bb6b645f8455131233d3b78ff
end

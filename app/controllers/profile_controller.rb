class ProfileController < ApplicationController
	skip_before_action :authorize, only: :show	
  def show
  @partners = Partner.find_by_username(params[:username])
  @products = Product.find_by(params[:id])
  end
end

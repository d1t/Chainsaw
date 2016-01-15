class DashboardController < ApplicationController
  def show
  @partner = Partner.find_by(params[:id])
  @order = Order.find_by(params[:stores_id])
  @product = Product.find_by(params[:id])
  @total_orders = Order.count
  end
end

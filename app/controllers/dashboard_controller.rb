class DashboardController < ApplicationController
  
  def show
	order = Order.find_by(params[:id])
	@store = Store.find_by(params[:id])
	@sto = @store.user_id
	#   @order = Order.find_by(params[:id]) 
	#   @ord = @order.where(:user)
	#  @line_item = Line_item.find_by(:store)
 end
end

class DashboardController < ApplicationController
  def show
  @order = Order.order(:partner)
  @line_item = Line_item.find_by(:store)
  end
end


#  product = Product.find_by(params[:product_id])
#  @line_item = @cart.add_product(product.id)
#  @order = Order.find_by(params[:stores_id])
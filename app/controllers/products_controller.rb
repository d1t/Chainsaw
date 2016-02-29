class ProductsController < ApplicationController
  include CurrentCart
  skip_before_action :authorize, only: :show
  before_action :set_cart
  before_action :authorize, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_product, only: [:edit, :update, :destroy]

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
    render :show, layout: false
  end

  def new
    @product = Product.new
  end

  def edit
  end

  def create
    @product = current_user.products.build(product_params)
    @product.store = current_user.store

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def who_bought
    @product = Product.find(params[:id])
    @latest_order = @product.orders.order(:updated_at).last
    if stale?(@latest_order)
      respond_to do |format|
        format.atom
      end
    end
  end


  private

    def set_product
      @product = if current_user
        current_user.products.find_by(id: params[:id])
      else
        Product.find(params[:id])
      end
      unless @product
        flash[:alert] = 'Unauthorized for logged user'
        redirect_to products_path
      end
    end

    def authorize
      unless current_user
        flash[:alert] = 'Unauthorized'
        redirect_to products_path
      end
    end

    def product_params
      params.require(:product).permit(:title, :description, :quantity, :category, :subcategory, :image, :price, :delivery_price)
    end
end

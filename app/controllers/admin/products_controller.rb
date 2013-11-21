class Admin::ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  skip_before_filter :require_log_in

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(admin_product_params)

      if @product.save
        redirect_to admin_product_path(@product), notice: 'Product was successfully created.'
      else
        render action: 'new'
      end
  end

  def update
    if @product.update(admin_product_params)
      redirect_to admin_product_path(@product), notice: 'Product was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @product.destroy
      redirect_to admin_products_url, notice: 'Product was successfully deleted.'
  end

  private
    def set_product
      @product = Product.find(params[:id])
    end

    def admin_product_params
      params.require(:product).permit(:name, :price, :url)
    end
end

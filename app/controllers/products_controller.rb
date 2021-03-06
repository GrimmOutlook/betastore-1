class ProductsController < ApplicationController
	skip_before_filter :require_log_in

	def index
		@products_page = true
	    @categories = Category.all

	    scope = Product

	    if params[:min_price].present?
	      scope = scope.where('price >= ?', params[:min_price])
	    end

	    if params[:max_price].present?
	      scope = scope.where('price <= ?', params[:min_price])
	    end

	    if params[:category_id].present?
	      scope = scope.in_category(params[:category_id])
	    end

	    @products = scope.page(params[:page]).per(12)

	    respond_to do |format|
	      format.html
	      format.rss
	    end
	end

	# def create
	# 	@product = Product.new(product_params)

	# 	respond_to do |format|
	# 		if @product.save
	# 			format.html do
	# 				redirect_to product_path(@product), notice: 'Product was saved'
	# 			end
	# 			format.json do
	# 				render json: @product
	# 			end
	# 		else
	# 			format.html do
	# 				render 'edit'
	# 			end
	# 			format.json do
	# 				render json: { errors: @product.errors}, status: 422
	# 			end
	# 		end
	# 	end
	# end

	def show
		@product = Product.find(params[:id])
	end

	# private
	# def product_params
	# 	params.require(:product).permit(:name, :price)
	# end

end
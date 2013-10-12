class ProductsController < ApplicationController
	skip_before_filter :require_log_in

	def index
		@page_title = "Products"
		logger.debug "PARAMS: #{params.inspect}"
	end
end
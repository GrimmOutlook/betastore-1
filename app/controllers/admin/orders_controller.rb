class Admin::OrdersController < ApplicationController
skip_before_filter :require_log_in

def index
	@orders = Order.all
end

end
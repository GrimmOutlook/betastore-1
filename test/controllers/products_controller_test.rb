require 'test_helper'

class ProductsControllerTest < ActionController::TestCase

	test "index" do
		get :index
		assert_response :success
		assert_select "a h4", products(:test).name
	end

	test "show" do
		get :show, id: products(:test).id
		assert_response :success

		assert_select "h4", text: 'Example', count: 1
		assert_select "h4", text: 'Other', count: 0
	end

end

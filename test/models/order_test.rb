require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  test "Order placed yesterday is returned by recent" do
     assert Order.recent.include?(orders(:yesterday))
  end

  test "Order placed 10 days ago is not returned by recent" do
  	assert !Order.recent.include?(orders(:ten_days_ago))
  end

end

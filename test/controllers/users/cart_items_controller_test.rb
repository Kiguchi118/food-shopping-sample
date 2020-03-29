require 'test_helper'

class Users::CartItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get users_cart_items_index_url
    assert_response :success
  end

end

require 'test_helper'

class Users::OrdersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get users_orders_new_url
    assert_response :success
  end

  test "should get index" do
    get users_orders_index_url
    assert_response :success
  end

  test "should get show" do
    get users_orders_show_url
    assert_response :success
  end

end

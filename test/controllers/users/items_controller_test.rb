require 'test_helper'

class Users::ItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get users_items_index_url
    assert_response :success
  end

  test "should get show" do
    get users_items_show_url
    assert_response :success
  end

end

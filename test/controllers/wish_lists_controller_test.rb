require "test_helper"

class WishListsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get wish_lists_index_url
    assert_response :success
  end

  test "should get show" do
    get wish_lists_show_url
    assert_response :success
  end
end

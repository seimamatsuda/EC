require 'test_helper'

class ItemControllerTest < ActionDispatch::IntegrationTest
  test "should get itemdetail" do
    get item_itemdetail_url
    assert_response :success
  end

end

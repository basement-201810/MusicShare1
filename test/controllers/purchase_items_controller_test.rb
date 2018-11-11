require 'test_helper'

class PurchaseItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get purchase_items_index_url
    assert_response :success
  end

end

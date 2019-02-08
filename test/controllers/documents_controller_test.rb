require 'test_helper'

class DocumentsControllerTest < ActionDispatch::IntegrationTest
  test "should get checkin" do
    get documents_checkin_url
    assert_response :success
  end

  test "should get checkout" do
    get documents_checkout_url
    assert_response :success
  end

end

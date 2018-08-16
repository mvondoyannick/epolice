require 'test_helper'

class UControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get u_index_url
    assert_response :success
  end

  test "should get private" do
    get u_private_url
    assert_response :success
  end

end

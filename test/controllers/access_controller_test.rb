require 'test_helper'

class AccessControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get access_index_url
    assert_response :success
  end

  test "should get login" do
    get access_login_url
    assert_response :success
  end

end

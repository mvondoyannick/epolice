require 'test_helper'

class AgisControllerTest < ActionDispatch::IntegrationTest
  test "should get console" do
    get agis_console_url
    assert_response :success
  end

end

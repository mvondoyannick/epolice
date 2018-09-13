require 'test_helper'

class MetropoliControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get metropoli_index_url
    assert_response :success
  end

end

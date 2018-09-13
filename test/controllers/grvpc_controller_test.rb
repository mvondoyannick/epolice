require 'test_helper'

class GrvpcControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get grvpc_index_url
    assert_response :success
  end

end

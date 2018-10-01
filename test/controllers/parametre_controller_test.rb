require 'test_helper'

class ParametreControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get parametre_index_url
    assert_response :success
  end

end

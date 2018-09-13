require 'test_helper'

class AssuranceControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get assurance_index_url
    assert_response :success
  end

  test "should get detail" do
    get assurance_detail_url
    assert_response :success
  end

  test "should get pay" do
    get assurance_pay_url
    assert_response :success
  end

  test "should get bilan" do
    get assurance_bilan_url
    assert_response :success
  end

end

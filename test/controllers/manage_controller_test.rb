require 'test_helper'

class ManageControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get manage_index_url
    assert_response :success
  end

  test "should get admin" do
    get manage_admin_url
    assert_response :success
  end

  test "should get grvpc" do
    get manage_grvpc_url
    assert_response :success
  end

  test "should get assurance" do
    get manage_assurance_url
    assert_response :success
  end

  test "should get member" do
    get manage_member_url
    assert_response :success
  end

  test "should get metropolis" do
    get manage_metropolis_url
    assert_response :success
  end

end

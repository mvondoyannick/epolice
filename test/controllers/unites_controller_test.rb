require 'test_helper'

class UnitesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @unite = unites(:one)
  end

  test "should get index" do
    get unites_url
    assert_response :success
  end

  test "should get new" do
    get new_unite_url
    assert_response :success
  end

  test "should create unite" do
    assert_difference('Unite.count') do
      post unites_url, params: { unite: { name: @unite.name } }
    end

    assert_redirected_to unite_url(Unite.last)
  end

  test "should show unite" do
    get unite_url(@unite)
    assert_response :success
  end

  test "should get edit" do
    get edit_unite_url(@unite)
    assert_response :success
  end

  test "should update unite" do
    patch unite_url(@unite), params: { unite: { name: @unite.name } }
    assert_redirected_to unite_url(@unite)
  end

  test "should destroy unite" do
    assert_difference('Unite.count', -1) do
      delete unite_url(@unite)
    end

    assert_redirected_to unites_url
  end
end

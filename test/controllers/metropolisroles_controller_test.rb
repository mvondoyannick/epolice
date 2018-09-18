require 'test_helper'

class MetropolisrolesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @metropolisrole = metropolisroles(:one)
  end

  test "should get index" do
    get metropolisroles_url
    assert_response :success
  end

  test "should get new" do
    get new_metropolisrole_url
    assert_response :success
  end

  test "should create metropolisrole" do
    assert_difference('Metropolisrole.count') do
      post metropolisroles_url, params: { metropolisrole: { description: @metropolisrole.description, name: @metropolisrole.name } }
    end

    assert_redirected_to metropolisrole_url(Metropolisrole.last)
  end

  test "should show metropolisrole" do
    get metropolisrole_url(@metropolisrole)
    assert_response :success
  end

  test "should get edit" do
    get edit_metropolisrole_url(@metropolisrole)
    assert_response :success
  end

  test "should update metropolisrole" do
    patch metropolisrole_url(@metropolisrole), params: { metropolisrole: { description: @metropolisrole.description, name: @metropolisrole.name } }
    assert_redirected_to metropolisrole_url(@metropolisrole)
  end

  test "should destroy metropolisrole" do
    assert_difference('Metropolisrole.count', -1) do
      delete metropolisrole_url(@metropolisrole)
    end

    assert_redirected_to metropolisroles_url
  end
end

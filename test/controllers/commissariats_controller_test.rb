require 'test_helper'

class CommissariatsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @commissariat = commissariats(:one)
  end

  test "should get index" do
    get commissariats_url
    assert_response :success
  end

  test "should get new" do
    get new_commissariat_url
    assert_response :success
  end

  test "should create commissariat" do
    assert_difference('Commissariat.count') do
      post commissariats_url, params: { commissariat: { name: @commissariat.name, phone: @commissariat.phone, ville_id: @commissariat.ville_id } }
    end

    assert_redirected_to commissariat_url(Commissariat.last)
  end

  test "should show commissariat" do
    get commissariat_url(@commissariat)
    assert_response :success
  end

  test "should get edit" do
    get edit_commissariat_url(@commissariat)
    assert_response :success
  end

  test "should update commissariat" do
    patch commissariat_url(@commissariat), params: { commissariat: { name: @commissariat.name, phone: @commissariat.phone, ville_id: @commissariat.ville_id } }
    assert_redirected_to commissariat_url(@commissariat)
  end

  test "should destroy commissariat" do
    assert_difference('Commissariat.count', -1) do
      delete commissariat_url(@commissariat)
    end

    assert_redirected_to commissariats_url
  end
end

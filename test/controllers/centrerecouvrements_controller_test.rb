require 'test_helper'

class CentrerecouvrementsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @centrerecouvrement = centrerecouvrements(:one)
  end

  test "should get index" do
    get centrerecouvrements_url
    assert_response :success
  end

  test "should get new" do
    get new_centrerecouvrement_url
    assert_response :success
  end

  test "should create centrerecouvrement" do
    assert_difference('Centrerecouvrement.count') do
      post centrerecouvrements_url, params: { centrerecouvrement: { name: @centrerecouvrement.name, phone: @centrerecouvrement.phone, region_id: @centrerecouvrement.region_id } }
    end

    assert_redirected_to centrerecouvrement_url(Centrerecouvrement.last)
  end

  test "should show centrerecouvrement" do
    get centrerecouvrement_url(@centrerecouvrement)
    assert_response :success
  end

  test "should get edit" do
    get edit_centrerecouvrement_url(@centrerecouvrement)
    assert_response :success
  end

  test "should update centrerecouvrement" do
    patch centrerecouvrement_url(@centrerecouvrement), params: { centrerecouvrement: { name: @centrerecouvrement.name, phone: @centrerecouvrement.phone, region_id: @centrerecouvrement.region_id } }
    assert_redirected_to centrerecouvrement_url(@centrerecouvrement)
  end

  test "should destroy centrerecouvrement" do
    assert_difference('Centrerecouvrement.count', -1) do
      delete centrerecouvrement_url(@centrerecouvrement)
    end

    assert_redirected_to centrerecouvrements_url
  end
end

require 'test_helper'

class CarrefoursControllerTest < ActionDispatch::IntegrationTest
  setup do
    @carrefour = carrefours(:one)
  end

  test "should get index" do
    get carrefours_url
    assert_response :success
  end

  test "should get new" do
    get new_carrefour_url
    assert_response :success
  end

  test "should create carrefour" do
    assert_difference('Carrefour.count') do
      post carrefours_url, params: { carrefour: { description: @carrefour.description, image: @carrefour.image, name: @carrefour.name, quartier: @carrefour.quartier, status: @carrefour.status } }
    end

    assert_redirected_to carrefour_url(Carrefour.last)
  end

  test "should show carrefour" do
    get carrefour_url(@carrefour)
    assert_response :success
  end

  test "should get edit" do
    get edit_carrefour_url(@carrefour)
    assert_response :success
  end

  test "should update carrefour" do
    patch carrefour_url(@carrefour), params: { carrefour: { description: @carrefour.description, image: @carrefour.image, name: @carrefour.name, quartier: @carrefour.quartier, status: @carrefour.status } }
    assert_redirected_to carrefour_url(@carrefour)
  end

  test "should destroy carrefour" do
    assert_difference('Carrefour.count', -1) do
      delete carrefour_url(@carrefour)
    end

    assert_redirected_to carrefours_url
  end
end

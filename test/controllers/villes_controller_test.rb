require 'test_helper'

class VillesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ville = villes(:one)
  end

  test "should get index" do
    get villes_url
    assert_response :success
  end

  test "should get new" do
    get new_ville_url
    assert_response :success
  end

  test "should create ville" do
    assert_difference('Ville.count') do
      post villes_url, params: { ville: { lat: @ville.lat, long: @ville.long, name: @ville.name } }
    end

    assert_redirected_to ville_url(Ville.last)
  end

  test "should show ville" do
    get ville_url(@ville)
    assert_response :success
  end

  test "should get edit" do
    get edit_ville_url(@ville)
    assert_response :success
  end

  test "should update ville" do
    patch ville_url(@ville), params: { ville: { lat: @ville.lat, long: @ville.long, name: @ville.name } }
    assert_redirected_to ville_url(@ville)
  end

  test "should destroy ville" do
    assert_difference('Ville.count', -1) do
      delete ville_url(@ville)
    end

    assert_redirected_to villes_url
  end
end

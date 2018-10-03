require 'test_helper'

class PaiementsolutionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @paiementsolution = paiementsolutions(:one)
  end

  test "should get index" do
    get paiementsolutions_url
    assert_response :success
  end

  test "should get new" do
    get new_paiementsolution_url
    assert_response :success
  end

  test "should create paiementsolution" do
    assert_difference('Paiementsolution.count') do
      post paiementsolutions_url, params: { paiementsolution: { name: @paiementsolution.name, operator: @paiementsolution.operator } }
    end

    assert_redirected_to paiementsolution_url(Paiementsolution.last)
  end

  test "should show paiementsolution" do
    get paiementsolution_url(@paiementsolution)
    assert_response :success
  end

  test "should get edit" do
    get edit_paiementsolution_url(@paiementsolution)
    assert_response :success
  end

  test "should update paiementsolution" do
    patch paiementsolution_url(@paiementsolution), params: { paiementsolution: { name: @paiementsolution.name, operator: @paiementsolution.operator } }
    assert_redirected_to paiementsolution_url(@paiementsolution)
  end

  test "should destroy paiementsolution" do
    assert_difference('Paiementsolution.count', -1) do
      delete paiementsolution_url(@paiementsolution)
    end

    assert_redirected_to paiementsolutions_url
  end
end

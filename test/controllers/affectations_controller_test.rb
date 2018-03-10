require 'test_helper'

class AffectationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @affectation = affectations(:one)
  end

  test "should get index" do
    get affectations_url
    assert_response :success
  end

  test "should get new" do
    get new_affectation_url
    assert_response :success
  end

  test "should create affectation" do
    assert_difference('Affectation.count') do
      post affectations_url, params: { affectation: { type_id: @affectation.type_id } }
    end

    assert_redirected_to affectation_url(Affectation.last)
  end

  test "should show affectation" do
    get affectation_url(@affectation)
    assert_response :success
  end

  test "should get edit" do
    get edit_affectation_url(@affectation)
    assert_response :success
  end

  test "should update affectation" do
    patch affectation_url(@affectation), params: { affectation: { type_id: @affectation.type_id } }
    assert_redirected_to affectation_url(@affectation)
  end

  test "should destroy affectation" do
    assert_difference('Affectation.count', -1) do
      delete affectation_url(@affectation)
    end

    assert_redirected_to affectations_url
  end
end

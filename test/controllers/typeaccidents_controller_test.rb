require 'test_helper'

class TypeaccidentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @typeaccident = typeaccidents(:one)
  end

  test "should get index" do
    get typeaccidents_url
    assert_response :success
  end

  test "should get new" do
    get new_typeaccident_url
    assert_response :success
  end

  test "should create typeaccident" do
    assert_difference('Typeaccident.count') do
      post typeaccidents_url, params: { typeaccident: { description: @typeaccident.description, name: @typeaccident.name } }
    end

    assert_redirected_to typeaccident_url(Typeaccident.last)
  end

  test "should show typeaccident" do
    get typeaccident_url(@typeaccident)
    assert_response :success
  end

  test "should get edit" do
    get edit_typeaccident_url(@typeaccident)
    assert_response :success
  end

  test "should update typeaccident" do
    patch typeaccident_url(@typeaccident), params: { typeaccident: { description: @typeaccident.description, name: @typeaccident.name } }
    assert_redirected_to typeaccident_url(@typeaccident)
  end

  test "should destroy typeaccident" do
    assert_difference('Typeaccident.count', -1) do
      delete typeaccident_url(@typeaccident)
    end

    assert_redirected_to typeaccidents_url
  end
end

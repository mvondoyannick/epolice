require 'test_helper'

class PieceretenusControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pieceretenu = pieceretenus(:one)
  end

  test "should get index" do
    get pieceretenus_url
    assert_response :success
  end

  test "should get new" do
    get new_pieceretenu_url
    assert_response :success
  end

  test "should create pieceretenu" do
    assert_difference('Pieceretenu.count') do
      post pieceretenus_url, params: { pieceretenu: { detail: @pieceretenu.detail, name: @pieceretenu.name } }
    end

    assert_redirected_to pieceretenu_url(Pieceretenu.last)
  end

  test "should show pieceretenu" do
    get pieceretenu_url(@pieceretenu)
    assert_response :success
  end

  test "should get edit" do
    get edit_pieceretenu_url(@pieceretenu)
    assert_response :success
  end

  test "should update pieceretenu" do
    patch pieceretenu_url(@pieceretenu), params: { pieceretenu: { detail: @pieceretenu.detail, name: @pieceretenu.name } }
    assert_redirected_to pieceretenu_url(@pieceretenu)
  end

  test "should destroy pieceretenu" do
    assert_difference('Pieceretenu.count', -1) do
      delete pieceretenu_url(@pieceretenu)
    end

    assert_redirected_to pieceretenus_url
  end
end

require 'test_helper'

class AlertesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @alerte = alertes(:one)
  end

  test "should get index" do
    get alertes_url
    assert_response :success
  end

  test "should get new" do
    get new_alerte_url
    assert_response :success
  end

  test "should create alerte" do
    assert_difference('Alerte.count') do
      post alertes_url, params: { alerte: { date: @alerte.date, description: @alerte.description, titre: @alerte.titre, ville_id: @alerte.ville_id } }
    end

    assert_redirected_to alerte_url(Alerte.last)
  end

  test "should show alerte" do
    get alerte_url(@alerte)
    assert_response :success
  end

  test "should get edit" do
    get edit_alerte_url(@alerte)
    assert_response :success
  end

  test "should update alerte" do
    patch alerte_url(@alerte), params: { alerte: { date: @alerte.date, description: @alerte.description, titre: @alerte.titre, ville_id: @alerte.ville_id } }
    assert_redirected_to alerte_url(@alerte)
  end

  test "should destroy alerte" do
    assert_difference('Alerte.count', -1) do
      delete alerte_url(@alerte)
    end

    assert_redirected_to alertes_url
  end
end

require 'test_helper'

class ArrondissementsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @arrondissement = arrondissements(:one)
  end

  test "should get index" do
    get arrondissements_url
    assert_response :success
  end

  test "should get new" do
    get new_arrondissement_url
    assert_response :success
  end

  test "should create arrondissement" do
    assert_difference('Arrondissement.count') do
      post arrondissements_url, params: { arrondissement: { departement_id: @arrondissement.departement_id, name: @arrondissement.name, region_id: @arrondissement.region_id } }
    end

    assert_redirected_to arrondissement_url(Arrondissement.last)
  end

  test "should show arrondissement" do
    get arrondissement_url(@arrondissement)
    assert_response :success
  end

  test "should get edit" do
    get edit_arrondissement_url(@arrondissement)
    assert_response :success
  end

  test "should update arrondissement" do
    patch arrondissement_url(@arrondissement), params: { arrondissement: { departement_id: @arrondissement.departement_id, name: @arrondissement.name, region_id: @arrondissement.region_id } }
    assert_redirected_to arrondissement_url(@arrondissement)
  end

  test "should destroy arrondissement" do
    assert_difference('Arrondissement.count', -1) do
      delete arrondissement_url(@arrondissement)
    end

    assert_redirected_to arrondissements_url
  end
end

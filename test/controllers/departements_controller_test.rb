require 'test_helper'

class DepartementsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @departement = departements(:one)
  end

  test "should get index" do
    get departements_url
    assert_response :success
  end

  test "should get new" do
    get new_departement_url
    assert_response :success
  end

  test "should create departement" do
    assert_difference('Departement.count') do
      post departements_url, params: { departement: { name: @departement.name, ville_id: @departement.ville_id } }
    end

    assert_redirected_to departement_url(Departement.last)
  end

  test "should show departement" do
    get departement_url(@departement)
    assert_response :success
  end

  test "should get edit" do
    get edit_departement_url(@departement)
    assert_response :success
  end

  test "should update departement" do
    patch departement_url(@departement), params: { departement: { name: @departement.name, ville_id: @departement.ville_id } }
    assert_redirected_to departement_url(@departement)
  end

  test "should destroy departement" do
    assert_difference('Departement.count', -1) do
      delete departement_url(@departement)
    end

    assert_redirected_to departements_url
  end
end

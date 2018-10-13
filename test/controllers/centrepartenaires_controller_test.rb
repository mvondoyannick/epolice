require 'test_helper'

class CentrepartenairesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @centrepartenaire = centrepartenaires(:one)
  end

  test "should get index" do
    get centrepartenaires_url
    assert_response :success
  end

  test "should get new" do
    get new_centrepartenaire_url
    assert_response :success
  end

  test "should create centrepartenaire" do
    assert_difference('Centrepartenaire.count') do
      post centrepartenaires_url, params: { centrepartenaire: { name: @centrepartenaire.name, structure_id: @centrepartenaire.structure_id } }
    end

    assert_redirected_to centrepartenaire_url(Centrepartenaire.last)
  end

  test "should show centrepartenaire" do
    get centrepartenaire_url(@centrepartenaire)
    assert_response :success
  end

  test "should get edit" do
    get edit_centrepartenaire_url(@centrepartenaire)
    assert_response :success
  end

  test "should update centrepartenaire" do
    patch centrepartenaire_url(@centrepartenaire), params: { centrepartenaire: { name: @centrepartenaire.name, structure_id: @centrepartenaire.structure_id } }
    assert_redirected_to centrepartenaire_url(@centrepartenaire)
  end

  test "should destroy centrepartenaire" do
    assert_difference('Centrepartenaire.count', -1) do
      delete centrepartenaire_url(@centrepartenaire)
    end

    assert_redirected_to centrepartenaires_url
  end
end

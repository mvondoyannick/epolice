require 'test_helper'

class GroupementsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @groupement = groupements(:one)
  end

  test "should get index" do
    get groupements_url
    assert_response :success
  end

  test "should get new" do
    get new_groupement_url
    assert_response :success
  end

  test "should create groupement" do
    assert_difference('Groupement.count') do
      post groupements_url, params: { groupement: { name: @groupement.name, phone: @groupement.phone, region_id: @groupement.region_id } }
    end

    assert_redirected_to groupement_url(Groupement.last)
  end

  test "should show groupement" do
    get groupement_url(@groupement)
    assert_response :success
  end

  test "should get edit" do
    get edit_groupement_url(@groupement)
    assert_response :success
  end

  test "should update groupement" do
    patch groupement_url(@groupement), params: { groupement: { name: @groupement.name, phone: @groupement.phone, region_id: @groupement.region_id } }
    assert_redirected_to groupement_url(@groupement)
  end

  test "should destroy groupement" do
    assert_difference('Groupement.count', -1) do
      delete groupement_url(@groupement)
    end

    assert_redirected_to groupements_url
  end
end

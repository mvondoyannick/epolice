require 'test_helper'

class GestionConstatControllerTest < ActionDispatch::IntegrationTest
  test "should get today" do
    get gestion_constat_today_url
    assert_response :success
  end

  test "should get hier" do
    get gestion_constat_hier_url
    assert_response :success
  end

  test "should get week" do
    get gestion_constat_week_url
    assert_response :success
  end

  test "should get mounth" do
    get gestion_constat_mounth_url
    assert_response :success
  end

  test "should get all" do
    get gestion_constat_all_url
    assert_response :success
  end

  test "should get cartography" do
    get gestion_constat_cartography_url
    assert_response :success
  end

  test "should get region" do
    get gestion_constat_region_url
    assert_response :success
  end

  test "should get assureur" do
    get gestion_constat_assureur_url
    assert_response :success
  end

end

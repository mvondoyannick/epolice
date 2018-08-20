require 'test_helper'

class GestionAlerteControllerTest < ActionDispatch::IntegrationTest
  test "should get today" do
    get gestion_alerte_today_url
    assert_response :success
  end

  test "should get week" do
    get gestion_alerte_week_url
    assert_response :success
  end

  test "should get mounth" do
    get gestion_alerte_mounth_url
    assert_response :success
  end

  test "should get cartography" do
    get gestion_alerte_cartography_url
    assert_response :success
  end

  test "should get region" do
    get gestion_alerte_region_url
    assert_response :success
  end

end

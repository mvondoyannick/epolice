require 'test_helper'

class GestionContraventionControllerTest < ActionDispatch::IntegrationTest
  test "should get today" do
    get gestion_contravention_today_url
    assert_response :success
  end

  test "should get week" do
    get gestion_contravention_week_url
    assert_response :success
  end

  test "should get mounth" do
    get gestion_contravention_mounth_url
    assert_response :success
  end

  test "should get cartography" do
    get gestion_contravention_cartography_url
    assert_response :success
  end

  test "should get region" do
    get gestion_contravention_region_url
    assert_response :success
  end

end

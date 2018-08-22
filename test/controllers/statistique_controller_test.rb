require 'test_helper'

class StatistiqueControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get statistique_index_url
    assert_response :success
  end

  test "should get day" do
    get statistique_day_url
    assert_response :success
  end

  test "should get week" do
    get statistique_week_url
    assert_response :success
  end

  test "should get mois" do
    get statistique_mois_url
    assert_response :success
  end

end

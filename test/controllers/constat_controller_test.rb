require 'test_helper'

class ConstatControllerTest < ActionDispatch::IntegrationTest
  test "should get read" do
    get constat_read_url
    assert_response :success
  end

  test "should get search" do
    get constat_search_url
    assert_response :success
  end

  test "should get transmettre" do
    get constat_transmettre_url
    assert_response :success
  end

  test "should get archiver" do
    get constat_archiver_url
    assert_response :success
  end

end

require 'test_helper'

class CompteControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get compte_index_url
    assert_response :success
  end

  test "should get validate" do
    get compte_validate_url
    assert_response :success
  end

  test "should get update" do
    get compte_update_url
    assert_response :success
  end

  test "should get authorise" do
    get compte_authorise_url
    assert_response :success
  end

  test "should get block" do
    get compte_block_url
    assert_response :success
  end

end

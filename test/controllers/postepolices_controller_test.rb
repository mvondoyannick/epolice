require 'test_helper'

class PostepolicesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @postepolice = postepolices(:one)
  end

  test "should get index" do
    get postepolices_url
    assert_response :success
  end

  test "should get new" do
    get new_postepolice_url
    assert_response :success
  end

  test "should create postepolice" do
    assert_difference('Postepolice.count') do
      post postepolices_url, params: { postepolice: { agent_id: @postepolice.agent_id, commissariat_id: @postepolice.commissariat_id, location: @postepolice.location, name: @postepolice.name } }
    end

    assert_redirected_to postepolice_url(Postepolice.last)
  end

  test "should show postepolice" do
    get postepolice_url(@postepolice)
    assert_response :success
  end

  test "should get edit" do
    get edit_postepolice_url(@postepolice)
    assert_response :success
  end

  test "should update postepolice" do
    patch postepolice_url(@postepolice), params: { postepolice: { agent_id: @postepolice.agent_id, commissariat_id: @postepolice.commissariat_id, location: @postepolice.location, name: @postepolice.name } }
    assert_redirected_to postepolice_url(@postepolice)
  end

  test "should destroy postepolice" do
    assert_difference('Postepolice.count', -1) do
      delete postepolice_url(@postepolice)
    end

    assert_redirected_to postepolices_url
  end
end

require 'test_helper'

class ContravetionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @contravetion = contravetions(:one)
  end

  test "should get index" do
    get contravetions_url
    assert_response :success
  end

  test "should get new" do
    get new_contravetion_url
    assert_response :success
  end

  test "should create contravetion" do
    assert_difference('Contravetion.count') do
      post contravetions_url, params: { contravetion: { Agent_id: @contravetion.Agent_id, motif: @contravetion.motif, status: @contravetion.status, token: @contravetion.token } }
    end

    assert_redirected_to contravetion_url(Contravetion.last)
  end

  test "should show contravetion" do
    get contravetion_url(@contravetion)
    assert_response :success
  end

  test "should get edit" do
    get edit_contravetion_url(@contravetion)
    assert_response :success
  end

  test "should update contravetion" do
    patch contravetion_url(@contravetion), params: { contravetion: { Agent_id: @contravetion.Agent_id, motif: @contravetion.motif, status: @contravetion.status, token: @contravetion.token } }
    assert_redirected_to contravetion_url(@contravetion)
  end

  test "should destroy contravetion" do
    assert_difference('Contravetion.count', -1) do
      delete contravetion_url(@contravetion)
    end

    assert_redirected_to contravetions_url
  end
end

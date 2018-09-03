require 'test_helper'

class AgentphonesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @agentphone = agentphones(:one)
  end

  test "should get index" do
    get agentphones_url
    assert_response :success
  end

  test "should get new" do
    get new_agentphone_url
    assert_response :success
  end

  test "should create agentphone" do
    assert_difference('Agentphone.count') do
      post agentphones_url, params: { agentphone: { fingerprint: @agentphone.fingerprint, imei: @agentphone.imei, phone: @agentphone.phone } }
    end

    assert_redirected_to agentphone_url(Agentphone.last)
  end

  test "should show agentphone" do
    get agentphone_url(@agentphone)
    assert_response :success
  end

  test "should get edit" do
    get edit_agentphone_url(@agentphone)
    assert_response :success
  end

  test "should update agentphone" do
    patch agentphone_url(@agentphone), params: { agentphone: { fingerprint: @agentphone.fingerprint, imei: @agentphone.imei, phone: @agentphone.phone } }
    assert_redirected_to agentphone_url(@agentphone)
  end

  test "should destroy agentphone" do
    assert_difference('Agentphone.count', -1) do
      delete agentphone_url(@agentphone)
    end

    assert_redirected_to agentphones_url
  end
end

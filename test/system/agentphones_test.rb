require "application_system_test_case"

class AgentphonesTest < ApplicationSystemTestCase
  setup do
    @agentphone = agentphones(:one)
  end

  test "visiting the index" do
    visit agentphones_url
    assert_selector "h1", text: "Agentphones"
  end

  test "creating a Agentphone" do
    visit agentphones_url
    click_on "New Agentphone"

    fill_in "Fingerprint", with: @agentphone.fingerprint
    fill_in "Imei", with: @agentphone.imei
    fill_in "Phone", with: @agentphone.phone
    click_on "Create Agentphone"

    assert_text "Agentphone was successfully created"
    click_on "Back"
  end

  test "updating a Agentphone" do
    visit agentphones_url
    click_on "Edit", match: :first

    fill_in "Fingerprint", with: @agentphone.fingerprint
    fill_in "Imei", with: @agentphone.imei
    fill_in "Phone", with: @agentphone.phone
    click_on "Update Agentphone"

    assert_text "Agentphone was successfully updated"
    click_on "Back"
  end

  test "destroying a Agentphone" do
    visit agentphones_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Agentphone was successfully destroyed"
  end
end

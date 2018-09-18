require "application_system_test_case"

class PostepolicesTest < ApplicationSystemTestCase
  setup do
    @postepolice = postepolices(:one)
  end

  test "visiting the index" do
    visit postepolices_url
    assert_selector "h1", text: "Postepolices"
  end

  test "creating a Postepolice" do
    visit postepolices_url
    click_on "New Postepolice"

    fill_in "Agent", with: @postepolice.agent_id
    fill_in "Commissariat", with: @postepolice.commissariat_id
    fill_in "Location", with: @postepolice.location
    fill_in "Name", with: @postepolice.name
    click_on "Create Postepolice"

    assert_text "Postepolice was successfully created"
    click_on "Back"
  end

  test "updating a Postepolice" do
    visit postepolices_url
    click_on "Edit", match: :first

    fill_in "Agent", with: @postepolice.agent_id
    fill_in "Commissariat", with: @postepolice.commissariat_id
    fill_in "Location", with: @postepolice.location
    fill_in "Name", with: @postepolice.name
    click_on "Update Postepolice"

    assert_text "Postepolice was successfully updated"
    click_on "Back"
  end

  test "destroying a Postepolice" do
    visit postepolices_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Postepolice was successfully destroyed"
  end
end

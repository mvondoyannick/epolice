require "application_system_test_case"

class GroupementsTest < ApplicationSystemTestCase
  setup do
    @groupement = groupements(:one)
  end

  test "visiting the index" do
    visit groupements_url
    assert_selector "h1", text: "Groupements"
  end

  test "creating a Groupement" do
    visit groupements_url
    click_on "New Groupement"

    fill_in "Name", with: @groupement.name
    fill_in "Phone", with: @groupement.phone
    fill_in "Region", with: @groupement.region_id
    click_on "Create Groupement"

    assert_text "Groupement was successfully created"
    click_on "Back"
  end

  test "updating a Groupement" do
    visit groupements_url
    click_on "Edit", match: :first

    fill_in "Name", with: @groupement.name
    fill_in "Phone", with: @groupement.phone
    fill_in "Region", with: @groupement.region_id
    click_on "Update Groupement"

    assert_text "Groupement was successfully updated"
    click_on "Back"
  end

  test "destroying a Groupement" do
    visit groupements_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Groupement was successfully destroyed"
  end
end

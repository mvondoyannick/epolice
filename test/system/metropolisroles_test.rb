require "application_system_test_case"

class MetropolisrolesTest < ApplicationSystemTestCase
  setup do
    @metropolisrole = metropolisroles(:one)
  end

  test "visiting the index" do
    visit metropolisroles_url
    assert_selector "h1", text: "Metropolisroles"
  end

  test "creating a Metropolisrole" do
    visit metropolisroles_url
    click_on "New Metropolisrole"

    fill_in "Description", with: @metropolisrole.description
    fill_in "Name", with: @metropolisrole.name
    click_on "Create Metropolisrole"

    assert_text "Metropolisrole was successfully created"
    click_on "Back"
  end

  test "updating a Metropolisrole" do
    visit metropolisroles_url
    click_on "Edit", match: :first

    fill_in "Description", with: @metropolisrole.description
    fill_in "Name", with: @metropolisrole.name
    click_on "Update Metropolisrole"

    assert_text "Metropolisrole was successfully updated"
    click_on "Back"
  end

  test "destroying a Metropolisrole" do
    visit metropolisroles_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Metropolisrole was successfully destroyed"
  end
end

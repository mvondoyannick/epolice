require "application_system_test_case"

class TypeaccidentsTest < ApplicationSystemTestCase
  setup do
    @typeaccident = typeaccidents(:one)
  end

  test "visiting the index" do
    visit typeaccidents_url
    assert_selector "h1", text: "Typeaccidents"
  end

  test "creating a Typeaccident" do
    visit typeaccidents_url
    click_on "New Typeaccident"

    fill_in "Description", with: @typeaccident.description
    fill_in "Name", with: @typeaccident.name
    click_on "Create Typeaccident"

    assert_text "Typeaccident was successfully created"
    click_on "Back"
  end

  test "updating a Typeaccident" do
    visit typeaccidents_url
    click_on "Edit", match: :first

    fill_in "Description", with: @typeaccident.description
    fill_in "Name", with: @typeaccident.name
    click_on "Update Typeaccident"

    assert_text "Typeaccident was successfully updated"
    click_on "Back"
  end

  test "destroying a Typeaccident" do
    visit typeaccidents_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Typeaccident was successfully destroyed"
  end
end

require "application_system_test_case"

class UnitesTest < ApplicationSystemTestCase
  setup do
    @unite = unites(:one)
  end

  test "visiting the index" do
    visit unites_url
    assert_selector "h1", text: "Unites"
  end

  test "creating a Unite" do
    visit unites_url
    click_on "New Unite"

    fill_in "Name", with: @unite.name
    click_on "Create Unite"

    assert_text "Unite was successfully created"
    click_on "Back"
  end

  test "updating a Unite" do
    visit unites_url
    click_on "Edit", match: :first

    fill_in "Name", with: @unite.name
    click_on "Update Unite"

    assert_text "Unite was successfully updated"
    click_on "Back"
  end

  test "destroying a Unite" do
    visit unites_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Unite was successfully destroyed"
  end
end

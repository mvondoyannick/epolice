require "application_system_test_case"

class LanguesTest < ApplicationSystemTestCase
  setup do
    @langue = langues(:one)
  end

  test "visiting the index" do
    visit langues_url
    assert_selector "h1", text: "Langues"
  end

  test "creating a Langue" do
    visit langues_url
    click_on "New Langue"

    fill_in "Name", with: @langue.name
    click_on "Create Langue"

    assert_text "Langue was successfully created"
    click_on "Back"
  end

  test "updating a Langue" do
    visit langues_url
    click_on "Edit", match: :first

    fill_in "Name", with: @langue.name
    click_on "Update Langue"

    assert_text "Langue was successfully updated"
    click_on "Back"
  end

  test "destroying a Langue" do
    visit langues_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Langue was successfully destroyed"
  end
end

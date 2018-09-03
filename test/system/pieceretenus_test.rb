require "application_system_test_case"

class PieceretenusTest < ApplicationSystemTestCase
  setup do
    @pieceretenu = pieceretenus(:one)
  end

  test "visiting the index" do
    visit pieceretenus_url
    assert_selector "h1", text: "Pieceretenus"
  end

  test "creating a Pieceretenu" do
    visit pieceretenus_url
    click_on "New Pieceretenu"

    fill_in "Detail", with: @pieceretenu.detail
    fill_in "Name", with: @pieceretenu.name
    click_on "Create Pieceretenu"

    assert_text "Pieceretenu was successfully created"
    click_on "Back"
  end

  test "updating a Pieceretenu" do
    visit pieceretenus_url
    click_on "Edit", match: :first

    fill_in "Detail", with: @pieceretenu.detail
    fill_in "Name", with: @pieceretenu.name
    click_on "Update Pieceretenu"

    assert_text "Pieceretenu was successfully updated"
    click_on "Back"
  end

  test "destroying a Pieceretenu" do
    visit pieceretenus_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Pieceretenu was successfully destroyed"
  end
end

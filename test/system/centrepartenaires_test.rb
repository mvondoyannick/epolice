require "application_system_test_case"

class CentrepartenairesTest < ApplicationSystemTestCase
  setup do
    @centrepartenaire = centrepartenaires(:one)
  end

  test "visiting the index" do
    visit centrepartenaires_url
    assert_selector "h1", text: "Centrepartenaires"
  end

  test "creating a Centrepartenaire" do
    visit centrepartenaires_url
    click_on "New Centrepartenaire"

    fill_in "Name", with: @centrepartenaire.name
    fill_in "Structure", with: @centrepartenaire.structure_id
    click_on "Create Centrepartenaire"

    assert_text "Centrepartenaire was successfully created"
    click_on "Back"
  end

  test "updating a Centrepartenaire" do
    visit centrepartenaires_url
    click_on "Edit", match: :first

    fill_in "Name", with: @centrepartenaire.name
    fill_in "Structure", with: @centrepartenaire.structure_id
    click_on "Update Centrepartenaire"

    assert_text "Centrepartenaire was successfully updated"
    click_on "Back"
  end

  test "destroying a Centrepartenaire" do
    visit centrepartenaires_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Centrepartenaire was successfully destroyed"
  end
end

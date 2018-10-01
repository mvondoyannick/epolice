require "application_system_test_case"

class DepartementsTest < ApplicationSystemTestCase
  setup do
    @departement = departements(:one)
  end

  test "visiting the index" do
    visit departements_url
    assert_selector "h1", text: "Departements"
  end

  test "creating a Departement" do
    visit departements_url
    click_on "New Departement"

    fill_in "Name", with: @departement.name
    fill_in "Ville", with: @departement.ville_id
    click_on "Create Departement"

    assert_text "Departement was successfully created"
    click_on "Back"
  end

  test "updating a Departement" do
    visit departements_url
    click_on "Edit", match: :first

    fill_in "Name", with: @departement.name
    fill_in "Ville", with: @departement.ville_id
    click_on "Update Departement"

    assert_text "Departement was successfully updated"
    click_on "Back"
  end

  test "destroying a Departement" do
    visit departements_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Departement was successfully destroyed"
  end
end

require "application_system_test_case"

class StructuresTest < ApplicationSystemTestCase
  setup do
    @structure = structures(:one)
  end

  test "visiting the index" do
    visit structures_url
    assert_selector "h1", text: "Structures"
  end

  test "creating a Structure" do
    visit structures_url
    click_on "New Structure"

    fill_in "Adresse", with: @structure.adresse
    fill_in "Contactemail", with: @structure.contactemail
    fill_in "Contactname", with: @structure.contactname
    fill_in "Contactphone", with: @structure.contactphone
    fill_in "Contantprenom", with: @structure.contantprenom
    fill_in "Name", with: @structure.name
    fill_in "Raison", with: @structure.raison
    fill_in "Region", with: @structure.region_id
    click_on "Create Structure"

    assert_text "Structure was successfully created"
    click_on "Back"
  end

  test "updating a Structure" do
    visit structures_url
    click_on "Edit", match: :first

    fill_in "Adresse", with: @structure.adresse
    fill_in "Contactemail", with: @structure.contactemail
    fill_in "Contactname", with: @structure.contactname
    fill_in "Contactphone", with: @structure.contactphone
    fill_in "Contantprenom", with: @structure.contantprenom
    fill_in "Name", with: @structure.name
    fill_in "Raison", with: @structure.raison
    fill_in "Region", with: @structure.region_id
    click_on "Update Structure"

    assert_text "Structure was successfully updated"
    click_on "Back"
  end

  test "destroying a Structure" do
    visit structures_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Structure was successfully destroyed"
  end
end

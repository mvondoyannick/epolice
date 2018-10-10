require "application_system_test_case"

class CentrerecouvrementsTest < ApplicationSystemTestCase
  setup do
    @centrerecouvrement = centrerecouvrements(:one)
  end

  test "visiting the index" do
    visit centrerecouvrements_url
    assert_selector "h1", text: "Centrerecouvrements"
  end

  test "creating a Centrerecouvrement" do
    visit centrerecouvrements_url
    click_on "New Centrerecouvrement"

    fill_in "Name", with: @centrerecouvrement.name
    fill_in "Phone", with: @centrerecouvrement.phone
    fill_in "Region", with: @centrerecouvrement.region_id
    click_on "Create Centrerecouvrement"

    assert_text "Centrerecouvrement was successfully created"
    click_on "Back"
  end

  test "updating a Centrerecouvrement" do
    visit centrerecouvrements_url
    click_on "Edit", match: :first

    fill_in "Name", with: @centrerecouvrement.name
    fill_in "Phone", with: @centrerecouvrement.phone
    fill_in "Region", with: @centrerecouvrement.region_id
    click_on "Update Centrerecouvrement"

    assert_text "Centrerecouvrement was successfully updated"
    click_on "Back"
  end

  test "destroying a Centrerecouvrement" do
    visit centrerecouvrements_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Centrerecouvrement was successfully destroyed"
  end
end

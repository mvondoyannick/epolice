require "application_system_test_case"

class ZonecouverturemotifsTest < ApplicationSystemTestCase
  setup do
    @zonecouverturemotif = zonecouverturemotifs(:one)
  end

  test "visiting the index" do
    visit zonecouverturemotifs_url
    assert_selector "h1", text: "Zonecouverturemotifs"
  end

  test "creating a Zonecouverturemotif" do
    visit zonecouverturemotifs_url
    click_on "New Zonecouverturemotif"

    fill_in "Detail", with: @zonecouverturemotif.detail
    fill_in "Name", with: @zonecouverturemotif.name
    click_on "Create Zonecouverturemotif"

    assert_text "Zonecouverturemotif was successfully created"
    click_on "Back"
  end

  test "updating a Zonecouverturemotif" do
    visit zonecouverturemotifs_url
    click_on "Edit", match: :first

    fill_in "Detail", with: @zonecouverturemotif.detail
    fill_in "Name", with: @zonecouverturemotif.name
    click_on "Update Zonecouverturemotif"

    assert_text "Zonecouverturemotif was successfully updated"
    click_on "Back"
  end

  test "destroying a Zonecouverturemotif" do
    visit zonecouverturemotifs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Zonecouverturemotif was successfully destroyed"
  end
end

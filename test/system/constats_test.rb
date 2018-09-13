require "application_system_test_case"

class ConstatsTest < ApplicationSystemTestCase
  setup do
    @constat = constats(:one)
  end

  test "visiting the index" do
    visit constats_url
    assert_selector "h1", text: "Constats"
  end

  test "creating a Constat" do
    visit constats_url
    click_on "New Constat"

    fill_in "Cni1", with: @constat.cni1
    fill_in "Cni2", with: @constat.cni2
    fill_in "Immatriculation1", with: @constat.immatriculation1
    fill_in "Immatriculation2", with: @constat.immatriculation2
    fill_in "Marque1", with: @constat.marque1
    fill_in "Marque2", with: @constat.marque2
    fill_in "Name1", with: @constat.name1
    fill_in "Name2", with: @constat.name2
    fill_in "Phone1", with: @constat.phone1
    fill_in "Phone2", with: @constat.phone2
    fill_in "Police1", with: @constat.police1
    fill_in "Police2", with: @constat.police2
    fill_in "Typeaccident", with: @constat.typeaccident_id
    click_on "Create Constat"

    assert_text "Constat was successfully created"
    click_on "Back"
  end

  test "updating a Constat" do
    visit constats_url
    click_on "Edit", match: :first

    fill_in "Cni1", with: @constat.cni1
    fill_in "Cni2", with: @constat.cni2
    fill_in "Immatriculation1", with: @constat.immatriculation1
    fill_in "Immatriculation2", with: @constat.immatriculation2
    fill_in "Marque1", with: @constat.marque1
    fill_in "Marque2", with: @constat.marque2
    fill_in "Name1", with: @constat.name1
    fill_in "Name2", with: @constat.name2
    fill_in "Phone1", with: @constat.phone1
    fill_in "Phone2", with: @constat.phone2
    fill_in "Police1", with: @constat.police1
    fill_in "Police2", with: @constat.police2
    fill_in "Typeaccident", with: @constat.typeaccident_id
    click_on "Update Constat"

    assert_text "Constat was successfully updated"
    click_on "Back"
  end

  test "destroying a Constat" do
    visit constats_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Constat was successfully destroyed"
  end
end

require "application_system_test_case"

class PaiementsolutionsTest < ApplicationSystemTestCase
  setup do
    @paiementsolution = paiementsolutions(:one)
  end

  test "visiting the index" do
    visit paiementsolutions_url
    assert_selector "h1", text: "Paiementsolutions"
  end

  test "creating a Paiementsolution" do
    visit paiementsolutions_url
    click_on "New Paiementsolution"

    fill_in "Name", with: @paiementsolution.name
    fill_in "Operator", with: @paiementsolution.operator
    click_on "Create Paiementsolution"

    assert_text "Paiementsolution was successfully created"
    click_on "Back"
  end

  test "updating a Paiementsolution" do
    visit paiementsolutions_url
    click_on "Edit", match: :first

    fill_in "Name", with: @paiementsolution.name
    fill_in "Operator", with: @paiementsolution.operator
    click_on "Update Paiementsolution"

    assert_text "Paiementsolution was successfully updated"
    click_on "Back"
  end

  test "destroying a Paiementsolution" do
    visit paiementsolutions_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Paiementsolution was successfully destroyed"
  end
end

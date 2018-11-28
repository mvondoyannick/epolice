require "application_system_test_case"

class PostCommissariatsTest < ApplicationSystemTestCase
  setup do
    @post_commissariat = post_commissariats(:one)
  end

  test "visiting the index" do
    visit post_commissariats_url
    assert_selector "h1", text: "Post Commissariats"
  end

  test "creating a Post commissariat" do
    visit post_commissariats_url
    click_on "New Post Commissariat"

    fill_in "Agent", with: @post_commissariat.agent_id
    fill_in "Commissariat", with: @post_commissariat.commissariat_id
    fill_in "Grade", with: @post_commissariat.grade_id
    click_on "Create Post commissariat"

    assert_text "Post commissariat was successfully created"
    click_on "Back"
  end

  test "updating a Post commissariat" do
    visit post_commissariats_url
    click_on "Edit", match: :first

    fill_in "Agent", with: @post_commissariat.agent_id
    fill_in "Commissariat", with: @post_commissariat.commissariat_id
    fill_in "Grade", with: @post_commissariat.grade_id
    click_on "Update Post commissariat"

    assert_text "Post commissariat was successfully updated"
    click_on "Back"
  end

  test "destroying a Post commissariat" do
    visit post_commissariats_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Post commissariat was successfully destroyed"
  end
end

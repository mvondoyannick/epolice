require "application_system_test_case"

class WorkflowsTest < ApplicationSystemTestCase
  setup do
    @workflow = workflows(:one)
  end

  test "visiting the index" do
    visit workflows_url
    assert_selector "h1", text: "Workflows"
  end

  test "creating a Workflow" do
    visit workflows_url
    click_on "New Workflow"

    fill_in "Document", with: @workflow.document
    fill_in "Status", with: @workflow.status
    click_on "Create Workflow"

    assert_text "Workflow was successfully created"
    click_on "Back"
  end

  test "updating a Workflow" do
    visit workflows_url
    click_on "Edit", match: :first

    fill_in "Document", with: @workflow.document
    fill_in "Status", with: @workflow.status
    click_on "Update Workflow"

    assert_text "Workflow was successfully updated"
    click_on "Back"
  end

  test "destroying a Workflow" do
    visit workflows_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Workflow was successfully destroyed"
  end
end

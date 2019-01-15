require "application_system_test_case"

class SpecificObjectivesTest < ApplicationSystemTestCase
  setup do
    @specific_objective = specific_objectives(:one)
  end

  test "visiting the index" do
    visit specific_objectives_url
    assert_selector "h1", text: "Specific Objectives"
  end

  test "creating a Specific objective" do
    visit specific_objectives_url
    click_on "New Specific Objective"

    fill_in "Comments", with: @specific_objective.comments
    fill_in "Name", with: @specific_objective.name
    click_on "Create Specific objective"

    assert_text "Specific objective was successfully created"
    click_on "Back"
  end

  test "updating a Specific objective" do
    visit specific_objectives_url
    click_on "Edit", match: :first

    fill_in "Comments", with: @specific_objective.comments
    fill_in "Name", with: @specific_objective.name
    click_on "Update Specific objective"

    assert_text "Specific objective was successfully updated"
    click_on "Back"
  end

  test "destroying a Specific objective" do
    visit specific_objectives_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Specific objective was successfully destroyed"
  end
end

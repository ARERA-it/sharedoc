require 'test_helper'

class SpecificObjectivesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @specific_objective = specific_objectives(:one)
  end

  test "should get index" do
    get specific_objectives_url
    assert_response :success
  end

  test "should get new" do
    get new_specific_objective_url
    assert_response :success
  end

  test "should create specific_objective" do
    assert_difference('SpecificObjective.count') do
      post specific_objectives_url, params: { specific_objective: { comments: @specific_objective.comments, name: @specific_objective.name } }
    end

    assert_redirected_to specific_objective_url(SpecificObjective.last)
  end

  test "should show specific_objective" do
    get specific_objective_url(@specific_objective)
    assert_response :success
  end

  test "should get edit" do
    get edit_specific_objective_url(@specific_objective)
    assert_response :success
  end

  test "should update specific_objective" do
    patch specific_objective_url(@specific_objective), params: { specific_objective: { comments: @specific_objective.comments, name: @specific_objective.name } }
    assert_redirected_to specific_objective_url(@specific_objective)
  end

  test "should destroy specific_objective" do
    assert_difference('SpecificObjective.count', -1) do
      delete specific_objective_url(@specific_objective)
    end

    assert_redirected_to specific_objectives_url
  end
end

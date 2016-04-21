require 'test_helper'

class ProjectsControllerTest < ActionController::TestCase
  setup do
    @project = projects(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:projects)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create project" do
    assert_difference('Project.count') do
      post :create, project: { account_number: @project.account_number, end_date: @project.end_date, funding_agency: @project.funding_agency, project_acronym: @project.project_acronym, project_director: @project.project_director, project_title: @project.project_title, start_date: @project.start_date, total_amount_spent: @project.total_amount_spent, total_budget: @project.total_budget }
    end

    assert_redirected_to project_path(assigns(:project))
  end

  test "should show project" do
    get :show, id: @project
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @project
    assert_response :success
  end

  test "should update project" do
    patch :update, id: @project, project: { account_number: @project.account_number, end_date: @project.end_date, funding_agency: @project.funding_agency, project_acronym: @project.project_acronym, project_director: @project.project_director, project_title: @project.project_title, start_date: @project.start_date, total_amount_spent: @project.total_amount_spent, total_budget: @project.total_budget }
    assert_redirected_to project_path(assigns(:project))
  end

  test "should destroy project" do
    assert_difference('Project.count', -1) do
      delete :destroy, id: @project
    end

    assert_redirected_to projects_path
  end
end

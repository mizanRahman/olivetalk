require 'test_helper'

class DegreesControllerTest < ActionController::TestCase
  setup do
    @degree = degrees(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:degrees)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create degree" do
    assert_difference('Degree.count') do
      post :create, degree: { end_date: @degree.end_date, primary_focus: @degree.primary_focus, secondary_focus: @degree.secondary_focus, start_date: @degree.start_date, type_of_degree: @degree.type_of_degree }
    end

    assert_redirected_to degree_path(assigns(:degree))
  end

  test "should show degree" do
    get :show, id: @degree
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @degree
    assert_response :success
  end

  test "should update degree" do
    put :update, id: @degree, degree: { end_date: @degree.end_date, primary_focus: @degree.primary_focus, secondary_focus: @degree.secondary_focus, start_date: @degree.start_date, type_of_degree: @degree.type_of_degree }
    assert_redirected_to degree_path(assigns(:degree))
  end

  test "should destroy degree" do
    assert_difference('Degree.count', -1) do
      delete :destroy, id: @degree
    end

    assert_redirected_to degrees_path
  end
end

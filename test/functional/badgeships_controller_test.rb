require 'test_helper'

class BadgeshipsControllerTest < ActionController::TestCase
  setup do
    @badgeship = badgeships(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:badgeships)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create badgeship" do
    assert_difference('Badgeship.count') do
      post :create, badgeship: {  }
    end

    assert_redirected_to badgeship_path(assigns(:badgeship))
  end

  test "should show badgeship" do
    get :show, id: @badgeship
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @badgeship
    assert_response :success
  end

  test "should update badgeship" do
    put :update, id: @badgeship, badgeship: {  }
    assert_redirected_to badgeship_path(assigns(:badgeship))
  end

  test "should destroy badgeship" do
    assert_difference('Badgeship.count', -1) do
      delete :destroy, id: @badgeship
    end

    assert_redirected_to badgeships_path
  end
end

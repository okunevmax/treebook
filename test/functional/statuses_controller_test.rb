require 'test_helper'

class StatusesControllerTest < ActionController::TestCase
  setup do
    @status = statuses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:statuses)
  end

  test "should render a new page on login"  do
    sign_in users(:jason)
    get :new
    assert_response :success
end

  test "should create post when logged in"  do
    post :create, status: { contet: "Hello" }
    assert_response :redirect
    assert_redirected_to new_user_session_path
  end

  test "should be redirected when not logged in" do
    get :new
    assert_response :redirect
    assert_redirected_to new_user_session_path
  end

  test "should log in to create status" do
  sign_in users(:jason)

    assert_difference('Status.count') do
      post :create, status: { contet: @status.contet}
    end

    assert_redirected_to status_path(assigns(:status))
  end

  test "should show status" do
    get :show, id: @status
    assert_response :success
  end

  test "should get edit when logged in" do
    sign_in users(:jason)
    get :edit, id: @status
    assert_response :success
  end

  test "should redirect  update status when not logged in" do
    put :update, id: @status, status: { contet: @status.contet}
    assert_response :redirect
    assert_redirected_to new_user_session_path
  end

  test "should update status when logged in" do
    sign_in users(:jason)
    put :update, id: @status, status: { contet: @status.contet}
    assert_redirected_to status_path(assigns(:status))
  end



  test "should destroy status" do
    assert_difference('Status.count', -1) do
      delete :destroy, id: @status
    end

    assert_redirected_to statuses_path
  end
end

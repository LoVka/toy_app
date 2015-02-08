require 'test_helper'

class MicropostsControllerTest < ActionController::TestCase
  setup do
    @user = users(:one)
    @micropost = microposts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success 
    assert_not_nil assigns(:microposts)
  end
 
  test "should get new" do
    sign_in :user, @user
    get :new
    assert_response :success
  end

  test "should create micropost" do
    sign_in :user, @user
    assert_difference('Micropost.count') do
      post :create, micropost: { content: @micropost.content, user_id: @micropost.user_id }
    end

    assert_redirected_to micropost_path(assigns(:micropost))
  end

  test "should show micropost" do
    sign_in :user, @user
    get :show, id: @micropost
    assert_response :success
  end

  test "should get edit" do
    sign_in :user, @user
    get :edit, id: @micropost
    assert_response :success
  end

  test "should redirect from edit ather user" do
    sign_in :user, users(:two) 
    get :edit, id: @micropost
    assert_redirected_to root_path
  end

  test "should update micropost" do
    sign_in :user, @user
    patch :update, id: @micropost, micropost: { content: @micropost.content, user_id: @micropost.user_id }
    assert_redirected_to micropost_path(assigns(:micropost))
  end

  test "should not update micropost ather user" do
    sign_in :user, users(:two)
    patch :update, id: @micropost, micropost: { content: @micropost.content, user_id: @micropost.user_id }
    assert_redirected_to root_path
  end

  test "should destroy micropost" do
    sign_in :user, @user
    assert_difference('Micropost.count', -1) do
      delete :destroy, id: @micropost
    end

    assert_redirected_to microposts_path
  end

  test "should not destroy micropost ather user" do
    sign_in :user, users(:two)
    assert_difference('Micropost.count', 0) do
      delete :destroy, id: @micropost
    end

    assert_redirected_to root_path
  end
end

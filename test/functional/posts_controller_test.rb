require 'test_helper'

class PostsControllerTest < ActionController::TestCase

  include Devise::TestHelpers
  
  setup do
    sign_in users(:user1)

    @post = posts(:one)    
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:posts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create post" do
    assert_difference('Post.count') do
      post :create, :post => @post.attributes
    end

    assert_redirected_to post_path(assigns(:post))

    assert_match(/successfully created/, flash[:notice])
  end

  test "should not create post with short title" do
    assert_response :success

    assert_difference('Post.count', 0) do
      attr = @post.attributes
      attr[:title] = 't'
      post :create, :post => attr
    end

  end

  test "should show post" do
    get :show, :id => @post.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @post.to_param
    assert_response :success
  end

  test "should update post" do
    put :update, :id => @post.to_param, :post => @post.attributes
    assert_redirected_to post_path(assigns(:post))
  end

  test "should destroy post" do
    assert_difference('Post.count', -1) do
      delete :destroy, :id => @post.to_param
    end

    assert_redirected_to posts_path
  end
end

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

  test "should get index view" do
    get :index
    
    assert_select 'title', /Index/
    assert_select 'td', /My Name \d/, 2
    assert_select 'td', /My Title \d/, 2
    assert_select 'td', /My Content \d/, 2
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create post" do
    assert_difference('Post.count') do
      post :create, :post => { :name => 'some dude', :title => 'Hi there', :content => 'This is my first post.'}
    end
  
    assert_redirected_to post_path(assigns(:post))

    assert_match(/successfully created/, flash[:notice])
  end

  test "should not create post with bad args" do
    assert_response :success

    # no name
    assert_difference('Post.count', 0) do
      post :create, :post => { :title => 'Hi', :content => 'This is my first post.'}
    end

    # short title
    assert_difference('Post.count', 0) do
      post :create, :post => { :name => 'some dude', :title => 'Hi', :content => 'This is my first post.'}
    end
  end

  test "should show post" do
    get :show, :id => @post.to_param

    assert_response :success
  end
  
  test "should show post view" do
    get :show, :id => @post.to_param
    
    assert_select 'title', /My Title/
    assert_select 'p', /My Name/
    assert_select 'p', /My Title/
    assert_select 'p', /My Content/    
  end

  test "should get edit" do
    get :edit, :id => @post.to_param
    assert_response :success
  end

  test "should get edit view" do
    get :edit, :id => @post.to_param
    assert_select "#post_name[type=text][value*=My Name]"

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

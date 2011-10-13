require 'test_helper'
require 'integration/test_integration_helper'

class UserFlowsTest < ActionDispatch::IntegrationTest
  fixtures :all
  #include Devise::TestHelpers

  def setup
    #sign_in_as 'user1@domain.org', 'password1'
  end

  def teardown
    #sign_out
  end
  
  test "view home" do
    visit "/"
    assert page.has_selector? 'h1', :text => 'Hello, World'
    assert page.has_link? 'My Blog'
  end

  test "000 login and logout" do
    sign_in_as 'user1@domain.org', 'password1'
    assert page.has_selector? 'p.notice', :text => 'Signed in successfully.'
    click_on "My Blog"
    sign_out
    assert page.has_selector? 'p.notice', :text => 'Signed out successfully.'
  end
  
  test "list posts" do
    sign_in_as 'user1@domain.org', 'password1'
    click_on "My Blog"
    assert page.has_selector? 'h1', :text => 'Listing posts in haml'
  end

  test 'new post' do
    sign_in_as 'user1@domain.org', 'password1'
    click_on 'My Blog'
    click_on 'New Post'
    fill_in 'Name', :with => 'test user1'
    fill_in 'Title', :with => 'test title'
    fill_in 'Content', :with => "test content\nsome more test content."
    fill_in 'Tag', :with => 'test tag'
    click_on 'Create Post'
    assert page.has_selector? 'p.notice', :text => 'Post was successfully created.'
  end
end

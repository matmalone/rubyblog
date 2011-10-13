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

  test "login" do
    sign_in_as 'user1@domain.org', 'password1'
    assert page.has_selector? 'p.notice', :text => /Signed in successfully.$/
    visit "/posts"
    sign_out
  end
  
  test "login and get posts index" do
    sign_in_as 'user1@domain.org', 'password1'
    visit '/posts'
    assert page.has_selector? 'h1', :text => 'Listing posts in haml'
    sign_out
  end
end

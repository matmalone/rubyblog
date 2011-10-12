require 'test_helper'
require 'integration/test_integration_helper'

class UserFlowsTest < ActionDispatch::IntegrationTest
  fixtures :all
  #include Devise::TestHelpers

  setup do
    #sign_in_as 'foo@bar.com', 'blahblah'
  end
  
  test "view home" do
    visit "/"
    assert_equal page.status_code, 200

    assert page.has_selector? 'h1', :text => 'Hello, World'
    assert https!
    assert page.has_link? 'My Blog'
  end

  test "login" do
    sign_in_as 'foo@bar.com', 'blahblah'
    assert page.has_selector? 'p.notice', :text => /Signed in successfully.$/
  end
  
  test "login and get posts index" do
    sign_in_as 'foo@bar.com', 'blahblah'
    visit '/posts'
    assert_equal page.status_code, 200
    assert page.has_selector? 'h1', :text => 'Listing posts in haml'
  end
end

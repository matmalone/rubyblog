require 'test_helper'

class UserFlowsTest < ActionDispatch::IntegrationTest
  fixtures :all
  #include Devise::TestHelpers

#  setup do
#    sign_in users(:user1)
#  end
  
  test "view home" do
    get "/"
    assert_response :success

    assert_select 'h1', /Hello, World/
    assert https!
    assert_select 'a', /My Blog/
  end

  test "login" do
    #post_via_redirect '/users/sign-in', :user_email =>
    #users(:user2).email, :user_password => users(:user2).password
    #get_sign_in_page
    
  end
end

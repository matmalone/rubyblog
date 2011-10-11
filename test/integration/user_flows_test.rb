require 'test_helper'
require 'integration/test_integration_helper'

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
    sign_in_as 'foo@bar.com', 'blahblah'
    assert_equal flash[:notice], "Signed in successfully."
  end
  
  test "index" do
    sign_in_as 'foo@bar.com', 'blahblah'
    get '/posts'
    assert_select 'h1', 'Listing posts in haml'
  end
end

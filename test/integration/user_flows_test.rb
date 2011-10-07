require 'test_helper'

class UserFlowsTest < ActionDispatch::IntegrationTest
  fixtures :all

  test "view home" do
    get "/"
    assert_response :success

    assert_select 'h1', /Hello, World/
    assert_select 'a[href=/posts]', /My Blog/
  end
end

require "test_helper"
require 'capybara/rails'

module ActionDispatch
  class IntegrationTest

    include Capybara::DSL
    
    # login with the given username and password
    def sign_in_as(email, password)
      user = User.create(:password => password, :password_confirmation => password, :email => email)
      #user.confirmed_at = Time.now 
      assert user.save!
      #post_via_redirect '/users/sign_in', :user => {:email => email, :password => password}
      visit '/users/sign_in'
      fill_in 'Email', :with => email
      fill_in 'Password', :with => password
      click_on 'Sign in'
      user      
    end 

    # destroy the user's session
    def sign_out
      delete '/users/sign_out'
    end
  end
end

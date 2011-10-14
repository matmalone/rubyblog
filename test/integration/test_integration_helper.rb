require "test_helper"
require 'capybara/rails'

module ActionDispatch
  class IntegrationTest

    include Capybara::DSL
    Capybara.javascript_driver = :webkit
    
    # login with the given username and password
    def sign_in_as(email, password)
      visit '/users/sign_in'

      if page.has_selector? 'p.alert', :text => /You are already signed in./
        return
      end
      
      fill_in 'Email', :with => email
      fill_in 'Password', :with => password
      click_on 'Sign in'
    end 

    # destroy the user's session
    def sign_out
      click_on 'Sign out'
    end
  end
end

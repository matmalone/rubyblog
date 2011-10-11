require "test_helper"

module ActionDispatch
  class IntegrationTest

    # login with the given username and password
    def sign_in_as(email, password)
      user = User.create(:password => password, :password_confirmation => password, :email => email)
      #user.confirmed_at = Time.now 
      assert user.save!
      post_via_redirect '/users/sign_in', :user => {:email => email, :password => password}
      user      
    end 

    # destroy the user's session
    def sign_out
      delete '/users/sign_out'
    end
  end
end

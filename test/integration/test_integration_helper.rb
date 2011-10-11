require "test_helper"

module ActionDispatch
  class IntegrationTest

    def sign_in_as(email, password)
      user = User.create(:password => password, :password_confirmation => password, :email => email)
      #user.confirmed_at = Time.now 
      assert user.save!
      post_via_redirect '/users/sign_in', :user => {:email => email, :password => password}
      user      
    end 
    def sign_out
      #click_link_or_button('Log Out')   
    end
  end
end

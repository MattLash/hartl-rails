require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  
  test "invalid signup information" do 
    get signup_path
    assert_no_difference 'User.count' do
      post signup_path, user: { name: "matt", email: "user2", password: "hello2", password_confirmation: "hello"} 
    end
    assert_template 'users/new'
  end
end

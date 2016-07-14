require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
  def setup
    @user = User.new(name: "Hodor", email: "hodo2r@gmail.com", password: "hello", password_confirmation: "hello")
    
  end
  
  test "Valid?" do
    assert @user.valid?
  end
  
  test "name should be present" do 
    @user.name = " "
    assert_not @user.valid?
  end
    
end

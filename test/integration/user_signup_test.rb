require 'test_helper'

class UserSignupTest < ActionDispatch::IntegrationTest

  test "should sign up new user" do
    get signup_path
    assert_template 'users/new'
    assert_difference 'User.count', 1 do
      post users_path, params: { user: { username: "Abba", email: "Abba@example.com", password: "password" } } 
      follow_redirect!
    end
    assert_template 'users/show'
    assert_match 'Abba', response.body
  end 
end

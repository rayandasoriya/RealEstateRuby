require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "should not save user without email" do
    user = User.new
    user.email = ""
    assert_not user.save
  end

  test "should not save user with invalid email" do
    user = User.new
    user.first_name = "User"
    user.email = "abc"
    user.password = "password"
    assert_not user.save
  end

  test "should not save user with password less than 6 chars" do
    user = User.new
    user.first_name = "User"
    user.email = "user@gmail.com"
    user.password = "pas"
    assert_not user.save
  end

  test "should not save user with existing email" do
    user = User.new
    user.first_name = "User"
    user.email = "admin@realestate.com"
    user.password = "password"
    user.is_admin = 1
    assert_not user.save
  end
end
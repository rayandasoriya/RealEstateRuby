require 'test_helper'

class UserControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:admin)
    @current_user = @user
  end

  test "should get index" do
    get users_path
    assert_response :found
  end

  test "should get new" do
    get users_url
    assert_response :found
  end

  test "should create user" do
      post users_url, params: { first_name: "User", email: "admin1@gmail.com", password: "password" }
    assert_response :success, "Added a new user"
    end

  test "should show user" do
    get users_url(@user)
    assert_response :found, "Only to admin"
  end

  test "should update user" do
    patch users_url(@user), params: { first_name: "User", email: "admin@realestate.com", password: "password"  }
    assert_response :unauthorized, "Log in to update a user"
  end

  test "should destroy user" do
    get cancel_user_registration_path(@user)
    assert_response :found, "Redirect to the login page"
  end

end
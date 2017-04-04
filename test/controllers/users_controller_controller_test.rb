require 'test_helper'

class UsersControllerControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get users_controller_home_url
    assert_response :success
  end

  test "should get help" do
    get users_controller_help_url
    assert_response :success
  end

end

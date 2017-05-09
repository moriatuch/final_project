require 'test_helper'

class ComparesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get compares_index_url
    assert_response :success
  end

  test "should get new" do
    get compares_new_url
    assert_response :success
  end

  test "should get create" do
    get compares_create_url
    assert_response :success
  end

  test "should get destroy" do
    get compares_destroy_url
    assert_response :success
  end

end

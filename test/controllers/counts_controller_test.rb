require 'test_helper'

class CountsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get counts_index_url
    assert_response :success
  end

  test "should get new" do
    get counts_new_url
    assert_response :success
  end

  test "should get create" do
    get counts_create_url
    assert_response :success
  end

  test "should get destroy" do
    get counts_destroy_url
    assert_response :success
  end

end

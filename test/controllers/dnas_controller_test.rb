require 'test_helper'

class DnasControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get dnas_index_url
    assert_response :success
  end

  test "should get new" do
    get dnas_new_url
    assert_response :success
  end

  test "should get create" do
    get dnas_create_url
    assert_response :success
  end

  test "should get destroy" do
    get dnas_destroy_url
    assert_response :success
  end

end

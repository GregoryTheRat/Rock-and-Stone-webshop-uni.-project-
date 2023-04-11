require "test_helper"

class CarriesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get carries_index_url
    assert_response :success
  end

  test "should get show" do
    get carries_show_url
    assert_response :success
  end

  test "should get new" do
    get carries_new_url
    assert_response :success
  end

  test "should get edit" do
    get carries_edit_url
    assert_response :success
  end

  test "should get create" do
    get carries_create_url
    assert_response :success
  end

  test "should get update" do
    get carries_update_url
    assert_response :success
  end

  test "should get destroy" do
    get carries_destroy_url
    assert_response :success
  end
end

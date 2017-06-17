require 'test_helper'

class StaticControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get static_index_url
    assert_response :success
  end

  test "should get categories" do
    get static_categories_url
    assert_response :success
  end

  test "should get facility_category_list" do
    get static_facility_category_list_url
    assert_response :success
  end

  test "should get single_facility" do
    get static_single_facility_url
    assert_response :success
  end

  test "should get add-facility" do
    get static_add-facility_url
    assert_response :success
  end

  test "should get login_page" do
    get static_login_page_url
    assert_response :success
  end

  test "should get register_page" do
    get static_register_page_url
    assert_response :success
  end

  test "should get profile" do
    get static_profile_url
    assert_response :success
  end

  test "should get contact_us" do
    get static_contact_us_url
    assert_response :success
  end

end

require 'test_helper'

class SearchPropertiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @search_property = search_properties(:one)
  end

  test "should get index" do
    get search_properties_url
    assert_response :success
  end

  test "should get new" do
    get new_search_property_url
    assert_response :success
  end

  test "should create search_property" do
    assert_difference('SearchProperty.count') do
      post search_properties_url, params: { search_property: {  } }
    end

    assert_redirected_to search_property_url(SearchProperty.last)
  end

  test "should show search_property" do
    get search_property_url(@search_property)
    assert_response :success
  end

  test "should get edit" do
    get edit_search_property_url(@search_property)
    assert_response :success
  end

  test "should update search_property" do
    patch search_property_url(@search_property), params: { search_property: {  } }
    assert_redirected_to search_property_url(@search_property)
  end

  test "should destroy search_property" do
    assert_difference('SearchProperty.count', -1) do
      delete search_property_url(@search_property)
    end

    assert_redirected_to search_properties_url
  end
end

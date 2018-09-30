require "application_system_test_case"

class SearchPropertiesTest < ApplicationSystemTestCase
  setup do
    @search_property = search_properties(:one)
  end

  test "visiting the index" do
    visit search_properties_url
    assert_selector "h1", text: "Search Properties"
  end

  test "creating a Search property" do
    visit search_properties_url
    click_on "New Search Property"

    click_on "Create Search property"

    assert_text "Search property was successfully created"
    click_on "Back"
  end

  test "updating a Search property" do
    visit search_properties_url
    click_on "Edit", match: :first

    click_on "Update Search property"

    assert_text "Search property was successfully updated"
    click_on "Back"
  end

  test "destroying a Search property" do
    visit search_properties_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Search property was successfully destroyed"
  end
end

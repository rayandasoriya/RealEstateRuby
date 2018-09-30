require "application_system_test_case"

class SearchesTest < ApplicationSystemTestCase
  setup do
    @search = searches(:one)
  end

  test "visiting the index" do
    visit searches_url
    assert_selector "h1", text: "Searches"
  end

  test "creating a Search" do
    visit searches_url
    click_on "New Search"

    click_on "Create Search"

    assert_text "Search was successfully created"
    click_on "Back"
  end

  test "updating a Search" do
    visit searches_url
    click_on "Edit", match: :first

    click_on "Update Search"

    assert_text "Search was successfully updated"
    click_on "Back"
  end

  test "destroying a Search" do
    visit searches_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Search was successfully destroyed"
  end
end

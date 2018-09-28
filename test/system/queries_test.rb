require "application_system_test_case"

class QueriesTest < ApplicationSystemTestCase
  setup do
    @query = queries(:one)
  end

  test "visiting the index" do
    visit queries_url
    assert_selector "h1", text: "Queries"
  end

  test "creating a Query" do
    visit queries_url
    click_on "New Query"

    click_on "Create Query"

    assert_text "Query was successfully created"
    click_on "Back"
  end

  test "updating a Query" do
    visit queries_url
    click_on "Edit", match: :first

    click_on "Update Query"

    assert_text "Query was successfully updated"
    click_on "Back"
  end

  test "destroying a Query" do
    visit queries_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Query was successfully destroyed"
  end
end

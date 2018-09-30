require "application_system_test_case"

class PotentialBuyersTest < ApplicationSystemTestCase
  setup do
    @potential_buyer = potential_buyers(:one)
  end

  test "visiting the index" do
    visit potential_buyers_url
    assert_selector "h1", text: "Potential Buyers"
  end

  test "creating a Potential buyer" do
    visit potential_buyers_url
    click_on "New Potential Buyer"

    click_on "Create Potential buyer"

    assert_text "Potential buyer was successfully created"
    click_on "Back"
  end

  test "updating a Potential buyer" do
    visit potential_buyers_url
    click_on "Edit", match: :first

    click_on "Update Potential buyer"

    assert_text "Potential buyer was successfully updated"
    click_on "Back"
  end

  test "destroying a Potential buyer" do
    visit potential_buyers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Potential buyer was successfully destroyed"
  end
end

require 'test_helper'

class PotentialBuyersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @potential_buyer = potential_buyers(:one)
  end

  test "should get index" do
    get potential_buyers_url
    assert_response :success
  end

  test "should get new" do
    get new_potential_buyer_url
    assert_response :success
  end

  test "should create potential_buyer" do
    assert_difference('PotentialBuyer.count') do
      post potential_buyers_url, params: { potential_buyer: {  } }
    end

    assert_redirected_to potential_buyer_url(PotentialBuyer.last)
  end

  test "should show potential_buyer" do
    get potential_buyer_url(@potential_buyer)
    assert_response :success
  end

  test "should get edit" do
    get edit_potential_buyer_url(@potential_buyer)
    assert_response :success
  end

  test "should update potential_buyer" do
    patch potential_buyer_url(@potential_buyer), params: { potential_buyer: {  } }
    assert_redirected_to potential_buyer_url(@potential_buyer)
  end

  test "should destroy potential_buyer" do
    assert_difference('PotentialBuyer.count', -1) do
      delete potential_buyer_url(@potential_buyer)
    end

    assert_redirected_to potential_buyers_url
  end
end

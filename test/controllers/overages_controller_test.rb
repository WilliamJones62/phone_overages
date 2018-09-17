require 'test_helper'

class OveragesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @overage = overages(:one)
  end

  test "should get index" do
    get overages_url
    assert_response :success
  end

  test "should get new" do
    get new_overage_url
    assert_response :success
  end

  test "should create overage" do
    assert_difference('Overage.count') do
      post overages_url, params: { overage: { added_data: @overage.added_data, name: @overage.name, number: @overage.number, overage_date: @overage.overage_date, reason: @overage.reason } }
    end

    assert_redirected_to overage_url(Overage.last)
  end

  test "should show overage" do
    get overage_url(@overage)
    assert_response :success
  end

  test "should get edit" do
    get edit_overage_url(@overage)
    assert_response :success
  end

  test "should update overage" do
    patch overage_url(@overage), params: { overage: { added_data: @overage.added_data, name: @overage.name, number: @overage.number, overage_date: @overage.overage_date, reason: @overage.reason } }
    assert_redirected_to overage_url(@overage)
  end

  test "should destroy overage" do
    assert_difference('Overage.count', -1) do
      delete overage_url(@overage)
    end

    assert_redirected_to overages_url
  end
end

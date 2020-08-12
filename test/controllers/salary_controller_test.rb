require 'test_helper'

class SalaryControllerTest < ActionDispatch::IntegrationTest
  test "should get basic" do
    get salary_basic_url
    assert_response :success
  end

  test "should get hra" do
    get salary_hra_url
    assert_response :success
  end

  test "should get internet_allowance" do
    get salary_internet_allowance_url
    assert_response :success
  end

  test "should get pf" do
    get salary_pf_url
    assert_response :success
  end

end

require 'test_helper'

class AccountsControllerTest < ActionDispatch::IntegrationTest
  test "should get search" do
    get accounts_search_url
    assert_response :success
  end

  test "should get details" do
    get accounts_details_url
    assert_response :success
  end

end

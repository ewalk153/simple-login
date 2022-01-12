require "test_helper"

class TotpManagementControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get totp_management_create_url
    assert_response :success
  end

  test "should get show" do
    get totp_management_show_url
    assert_response :success
  end
end

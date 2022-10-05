require "test_helper"

class Users::MyMemoControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get users_my_memo_show_url
    assert_response :success
  end
end

require "test_helper"

class Users::CalorieDentakuControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get users_calorie_dentaku_show_url
    assert_response :success
  end
end

require "test_helper"

class Users::MymemosIngredientsControllerTest < ActionDispatch::IntegrationTest
  test "should get destroy" do
    get users_mymemos_ingredients_destroy_url
    assert_response :success
  end
end

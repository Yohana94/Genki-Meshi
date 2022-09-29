require "test_helper"

class Public::IngredientsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get public_ingredients_create_url
    assert_response :success
  end

  test "should get new" do
    get public_ingredients_new_url
    assert_response :success
  end
end

require "test_helper"

class SwapsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get swaps_index_url
    assert_response :success
  end

  test "should get new" do
    get swaps_new_url
    assert_response :success
  end

  test "should get create" do
    get swaps_create_url
    assert_response :success
  end
end

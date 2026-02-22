require "test_helper"

class Api::V1::DroneFleetsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get api_v1_drone_fleets_index_url
    assert_response :success
  end

  test "should get create" do
    get api_v1_drone_fleets_create_url
    assert_response :success
  end
end

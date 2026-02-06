require "test_helper"

class Api::Ai::Phase7ControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get api_ai_phase7_index_url
    assert_response :success
  end
end

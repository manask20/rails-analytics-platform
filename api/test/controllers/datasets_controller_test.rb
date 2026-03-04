require "test_helper"

class DatasetsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get datasets_create_url
    assert_response :success
  end

  test "should get show" do
    get datasets_show_url
    assert_response :success
  end
end

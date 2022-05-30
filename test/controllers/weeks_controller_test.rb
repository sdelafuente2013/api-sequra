require 'test_helper'

class WeeksControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get weeks_show_url
    assert_response :success
  end

  test "should get index" do
    get weeks_index_url
    assert_response :success
  end

end

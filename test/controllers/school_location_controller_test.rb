require 'test_helper'

class SchoolLocationControllerTest < ActionDispatch::IntegrationTest
  test "should get near" do
    get school_location_near_url
    assert_response :success
  end

end

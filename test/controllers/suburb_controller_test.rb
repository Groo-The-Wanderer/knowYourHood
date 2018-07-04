require 'test_helper'

class SuburbControllerTest < ActionDispatch::IntegrationTest
  test "should get search" do
    get suburb_search_url
    assert_response :success
  end

end

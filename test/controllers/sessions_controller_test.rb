require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get search" do
    get sessions_search_url
    assert_response :success
  end

end

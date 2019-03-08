# require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
    include Devise::Test::IntegrationHelpers

  setup do
    @user       = users(:one)
    sign_in(@user)
  end

  test "should get directory" do
    get directory_url
    assert_response :success
  end
end

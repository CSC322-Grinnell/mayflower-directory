require 'test_helper'

class ProfilesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
    
  setup do
    @user = users(:one)
    @user.admin = true
    sign_in(@user)
  end
  
  test "should get new" do
    get profiles_new_url
    assert_response :success
  end

end

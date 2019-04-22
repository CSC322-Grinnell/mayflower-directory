# require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
    include Devise::Test::IntegrationHelpers

  setup do
    @user       = users(:one)
    sign_in(@user)
  end
end

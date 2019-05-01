require 'test_helper'

class ApplicationControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  test "should redirect login page when not logged in" do
    actions = [
      -> { get root_path },
      -> { get home_path },
      -> { get help_path },
      -> { get about_path },
      -> { get profiles_path },
      -> { post profiles_path },
      -> { get new_profile_path },
      -> { get edit_profile_path(0) },
      -> { get profile_path(0) },
      -> { put profile_path(0) },
      -> { delete profile_path(0) },
      -> { get users_path },
      -> { get edit_info_user_path(0) },
      -> { get edit_password_user_path(0) },
      -> { get user_path(0) },
      -> { put user_path(0) },
      -> { delete user_path(0) },
    ]

    actions.each do |action|
      action.call
      assert_response :redirect
      follow_redirect!
      assert_equal new_user_session_path, path
    end
  end
end

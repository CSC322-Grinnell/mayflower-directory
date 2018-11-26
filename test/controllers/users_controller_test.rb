# require 'test_helper'

# class UsersControllerTest < ActionDispatch::IntegrationTest

#   def setup
#     @user       = users(:saung)
#     @other_user = users(:other)
#   end
  
#   test "should redirect index page to login when not logged in" do
#     get users_path
#     assert_redirected_to login_url
#   end
  
#   test "should not allow the admin attribute to be changed on the web" do
#     log_in_as(@other_user)
#     assert_not @other_user.admin?
#     patch user_path(@other_user), params: {
#                                   user: { password:              "",
#                                           password_confirmation: "",
#                                           admin: true } }
#   assert_not @other_user.reload.admin?
#   end


# end

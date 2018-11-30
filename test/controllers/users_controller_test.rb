require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
include Devise::Test::IntegrationHelpers

#   def setup
#     @user       = users(:one)
#     @other_user = users(:two)
#   end
  
  setup do
    @user       = users(:one)
    sign_in(@user)
    @other_user = users(:two)
    sign_in(@other_user)
    @admin      = users(:three)
    @admin.admin = true
    sign_in(@admin)
  end
  
#   test "should redirect index page to login when not logged in" do
#     get users_path
#     assert_redirected_to :login
#   end
  
  test "should not allow the admin attribute to be changed on the web" do
    login_as(@other_user)
    assert_not @other_user.admin?
    patch user_path(@other_user), params: {
                                  user: { password:              "",
                                          password_confirmation: "",
                                          admin: true } }
  assert_not @other_user.reload.admin?
  end
  
  # test "should redirect to users page after deleting a user" do
  #     login_as(@admin)
  #     @user.destroy
  #     assert_redirected_to users_url
  # end
  
  test 'invalid without email' do
    @user.email = nil
    refute @user.valid?
    assert_not_nil @user.errors[:email]
  end
end

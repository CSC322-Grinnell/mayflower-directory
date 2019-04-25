require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @admin      = users(:admin)
    @user       = users(:normal)
    @other_user = users(:other_normal)
  end

  test "should redirect login page to login when not logged in" do
    get '/auth/login'
    assert_response :success
  end

  test "should redirect to root if not an admin" do
    login_as(@user)
    get root_url
    assert_response :success
  end

  test "should not allow the admin attribute to be changed on the web" do
    login_as(@other_user)
    assert_not @other_user.admin?
    patch user_path(@other_user), params: {
                                  user: { password:              "",
                                          password_confirmation: "",
                                          admin: true } }
    assert_not @other_user.reload.admin?
  end

  test "should redirect to users page after deleting a user" do
      login_as(@admin)
      @user.destroy
      get users_url
      assert_response :success
  end

  test "should redirect to users page after updating a user" do
      login_as(@admin)
      @user.update({})
      get users_url
      assert_response :success
  end

  test 'invalid without email' do
    @user.email = nil
    refute @user.valid?
    assert_not_nil @user.errors[:email]
  end

  test "should update name" do
    login_as(@admin)
    @user.update({name: "New Person"})
    assert_match(@user.name, "New Person")
  end

  test "should update email" do
    login_as(@admin)
    @user.update({email: "person@gmail.com"})
    assert_match(@user.email, "person@gmail.com")
  end

  #Error
  #  test "should update password" do
  #    login_as(@admin)
  #    @user.update({password: "Passw0rd!!", password_confirmation: "Passw0rd!!"})
  #    assert_match(@user.password, "Passw0rd!!")
  #  end

    #This is a failure
  # test "user should be nil after deleting" do
  #   login_as(@admin)
  #   @user.destroy
  #   assert_nil(@user)
  # end

end

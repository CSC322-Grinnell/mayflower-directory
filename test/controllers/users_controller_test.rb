require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @foo_info_attributes = {
      name: "Foo",
      email: "foobarbaz@bartell.com",
      admin: true,
    }
    @foo_password_attributes = {
      password:              "ValidP@ssword1",
      password_confirmation: "ValidP@ssword1",
    }
  end

  test "admin should be able to update user info" do
    login_as(users(:admin))
    user = users(:normal)

    get edit_info_user_path(user)
    assert_select "form[action='#{user_path(user)}']" do
      @foo_info_attributes.each_key do |attribute|
        assert_select "input[name='user[#{attribute}]']"
      end
    end

    put user_path(user), params: { user: @foo_info_attributes }
    user.reload

    @foo_info_attributes.each do |attribute, value|
      assert_equal value, user[attribute],
                   "Mismatched attribute #{attribute}"
    end
  end

  test "regular users should not be able to update user info" do
    login_as(users(:normal))
    user = users(:other_normal)

    old_attributes = user.attributes

    put user_path(user), params: { user: @foo_info_attributes }
    user.reload

    user.attributes.each do |attribute, value|
      assert_equal old_attributes[attribute], value,
                   "Mismatched attribute #{attribute}"
    end
  end

  test "should redirect to users page after updating a user" do
    login_as(users(:admin))
    put user_path(users(:normal)), params: { user: @foo_info_attributes }

    assert_response :redirect
    follow_redirect!
    assert_equal users_path, path
  end

  test "admin should be able to update user password" do
    login_as(users(:admin))
    user = users(:normal)

    old_encrypted_password = user.encrypted_password

    get edit_password_user_path(user)
    assert_select "form[action='#{user_path(user)}']" do
      @foo_password_attributes.each_key do |attribute|
        assert_select "input[name='user[#{attribute}]']"
      end
    end

    put user_path(user), params: { user: @foo_password_attributes }
    user.reload

    assert_not_equal old_encrypted_password, user.encrypted_password
  end

  test "regular users should not be able to update other user's password" do
    login_as(users(:normal))
    user = users(:other_normal)

    old_attributes = user.attributes

    put user_path(user), params: { user: @foo_password_attributes }
    user.reload

    user.attributes.each do |attribute, value|
      assert_equal old_attributes[attribute], value,
                   "Mismatched attribute #{attribute}"
    end
  end

  test "should redirect to users page after updating a password" do
    login_as(users(:admin))
    put user_path(users(:normal)), params: { user: @foo_password_attributes }

    assert_response :redirect
    follow_redirect!
    assert_equal users_path, path
  end

  test "admin should be able to delete a user" do
    login_as(users(:admin))

    assert_difference -> { User.all.count }, -1 do
      delete user_path(users(:normal))
    end
  end

  test "regular users should not be able to delete a user" do
    login_as(users(:normal))

    assert_no_difference -> { User.all.count } do
      delete user_path(users(:other_normal))
    end
  end

  test "should redirect to users page after deleting a user" do
    login_as(users(:admin))
    delete user_path(users(:normal))

    assert_response :redirect
    follow_redirect!
    assert_equal users_path, path
  end

end

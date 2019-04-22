require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  # TODO: regular users shouldn't be able to do anything

  test "should redirect to users page after deleting a user" do
    login_as(users(:admin))
    delete user_path(users(:normal))

    assert_response :redirect
    follow_redirect!
    assert_equal users_path, path
  end

  test "admin should be able to update user info" do
    login_as(users(:admin))
    user = users(:normal)
    foo_attributes = {
      name: "Foo",
      email: "foobarbaz@bartell.com",
      admin: true,
    }

    get edit_info_user_path(user)
    assert_select "form[action='#{user_path(user)}']" do
      foo_attributes.each_key do |attribute|
        assert_select "input[name='user[#{attribute}]']"
      end
    end

    put user_path(user), params: { user: foo_attributes }
    user.reload

    foo_attributes.each do |attribute, value|
      assert_equal value, user[attribute]
    end
  end

  test "should redirect to users page after updating a user" do
    login_as(users(:admin))
    put user_path(users(:normal)), params: { user: { name: "Foo" } }

    assert_response :redirect
    follow_redirect!
    assert_equal users_path, path
  end

  #Error
  #  test "should update password" do
  #    login_as(users(:admin))
  #    users(:normal).update({password: "Passw0rd!!", password_confirmation: "Passw0rd!!"})
  #    assert_match(users(:normal).password, "Passw0rd!!")
  #  end

    #This is a failure
  # test "user should be nil after deleting" do
  #   login_as(users(:admin))
  #   users(:normal).destroy
  #   assert_nil(users(:normal))
  # end

end

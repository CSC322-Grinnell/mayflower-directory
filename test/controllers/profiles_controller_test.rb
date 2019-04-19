# require 'test_helper'

class ProfilesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @bob_attributes = {
      first_name: "Bob",
      last_name: "Bobman",
      nickname: "Bobby",
      email: "bob@bob.com",
      address: "12345 High St",
      neighborhood: "Neighborhood One",
      spouse: "Jim",
      cell: "1234567",
      landline: "123456789",
    }
  end

  test "should show all profiles with no search" do
    login_as(users(:normal))
    get profiles_path
    assert_response :success
    assert_select ".profile" do |profile_elements|
      assert_select profile_elements[0], ".profile__name", "Green, Frog"
      assert_select profile_elements[1], ".profile__name", "No'Info, Sparse"
    end
  end

  test "should get new" do
    login_as(users(:admin))
    get profiles_new_path
    assert_response :success
  end

  test "should let admin users create profiles" do
    login_as(users(:admin))
    assert_difference -> { Profile.all.count }, 1 do
      post profiles_path, params: { profile: @bob_attributes }
    end
  end

  test "should not let unprivileged users create profiles" do
    login_as(users(:normal))
    assert_no_difference -> { Profile.all.count } do
      post profiles_path, params: { profile: @bob_attributes }
    end
  end

  test "should let admin users delete profiles" do
    login_as(users(:admin))
    assert_difference -> { Profile.all.count }, -1 do
      delete profile_path(profiles(:frog).id)
    end
  end

  test "should not let unprivileged users delete profiles" do
    login_as(users(:normal))
    assert_no_difference -> { Profile.all.count } do
      delete profile_path(profiles(:frog).id)
    end
  end

  test "should redirect to directory after delete" do
    login_as(users(:admin))
    delete profile_path(profiles(:frog))
    follow_redirect!
    assert_equal profiles_path, path
  end

  test "should let admin users update profiles" do
    login_as(users(:admin))
    profile = profiles(:frog)

    put profile_path(profile.id), params: { profile: @bob_attributes }

    updated_profile = Profile.find(profile.id)

    @bob_attributes.each do |key, value|
      assert_equal value, updated_profile[key]
    end
  end

  test "should not let unprivileged users update profiles" do
    login_as(users(:normal))
    profile = profiles(:frog)
    old_attributes = profile.attributes

    put profile_path(profile.id), params: { profile: @bob_attributes }

    Profile.find(profile.id).attributes.each do |key, value|
      assert_equal old_attributes[key], value
    end
  end

  test "should redirect to search after update" do
    login_as(users(:admin))
    profile = profiles(:frog)

    put profile_path(profile.id), params: { profile: @bob_attributes }
    follow_redirect!

    assert_equal profiles_path, path
  end

end

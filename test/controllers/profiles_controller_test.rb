require 'test_helper'

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
      assert_select profile_elements[0], ".profile__name", "Froggy Green (Frog)"
      assert_select profile_elements[1], ".profile__name", "Sparse No'Info"
    end
  end

  test "should normalize biography line breaks" do
    login_as(users(:normal))
    get profile_path(profiles(:frog))

    assert_select ".profile-detail__bio", "One\n\ntwo\n\nthree\n\nfour"
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
      delete profile_path(profiles(:frog))
    end
  end

  test "should not let unprivileged users delete profiles" do
    login_as(users(:normal))
    assert_no_difference -> { Profile.all.count } do
      delete profile_path(profiles(:frog))
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

    put profile_path(profile), params: { profile: @bob_attributes }
    profile.reload

    @bob_attributes.each do |key, value|
      assert_equal value, profile[key]
    end
  end

  test "should not let unprivileged users update profiles" do
    login_as(users(:normal))
    profile = profiles(:frog)
    old_attributes = profile.attributes

    put profile_path(profile), params: { profile: @bob_attributes }
    profile.reload

    profile.attributes.each do |key, value|
      assert_equal old_attributes[key], value
    end
  end

  test "should redirect to profile after updating it" do
    login_as(users(:admin))
    profile = profiles(:frog)

    put profile_path(profile), params: { profile: @bob_attributes }
    follow_redirect!

    assert_equal profile_path(profile), path
  end

  test "Unpriveleged users should not be able to import profiles" do
    login_as(users(:normal))
    profile_csv = fixture_file_upload('profile_imports.csv','text/csv')

    assert_no_difference -> {Profile.all.count} do
      post import_profiles_path, params:{file: profile_csv}
    end
  end

  test "Admins should be able to import profiles" do
    login_as(users(:admin))
    profile_csv = fixture_file_upload('profile_imports.csv','text/csv')

    assert_difference -> {Profile.all.count}, 4 do
      post import_profiles_path, params:{file: profile_csv}
    end
  end

end

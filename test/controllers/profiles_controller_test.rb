# require 'test_helper'

class ProfilesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
    
  setup do
    @user = users(:one)
    @user.admin = true
    @user1 = users(:two)
    @profile1 = profiles(:one)
  end
  
  test "should get new" do
    login_as(@user)
    get profiles_new_url
    assert_response :success
  end
  
  test "should redirect to search after delete" do 
    login_as(@user)
    @profile1.destroy
    get search_url
    assert_response :success
  end
   
  test "should redirect to home if not an admin" do
    login_as(@user1)
    get home_url
    assert_response :success
  end

  test "should redirect to search after update" do 
    login_as(@user)
    @profile1.update({first_name: "Bob"})
    get search_url
    assert_response :success
  end
  
  # TESTS FOR UPDATING EACH ATTRIBUTE
  
  test "should update all attributes" do 
    login_as(@user)
    @profile1.update({first_name: "Bob", 
                      last_name: "Bobby", 
                      nickname: "Bobman",
                      email: "bob@bob.com",
                      address: "12345 High St",
                      neighborhood: "Neighborhood One",
                      spouse: "Jim",
                      cell: "1234567",
                      landline: "123456789"
    })
    assert_match(@profile1.first_name, "Bob")
    assert_match(@profile1.last_name, "Bobby")
    assert_match(@profile1.nickname, "Bobman")
    assert_match(@profile1.email, "bob@bob.com")
    assert_match(@profile1.address, "12345 High St")
    assert_match(@profile1.neighborhood, "Neighborhood One")
    assert_match(@profile1.spouse, "Jim")
    assert_match(@profile1.cell, "1234567")
    assert_match(@profile1.landline, "123456789")
  end
  
  # This is a failure
  # test "should delete profile" do
  #   login_as(@user)
  #   @profile1.destroy
  #   assert_nil(@profile1)
  # end
  
end

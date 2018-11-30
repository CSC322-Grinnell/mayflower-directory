require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  
  include Devise::Test::ControllerHelpers
  
  # def sign_in(user)
  #   post user_session_path \
  #     "test1@test.com"    => user.email,
  #     "Passw0rd!" => user.password
  # end
  
  setup do
    @test1 = users(:one)
    sign_in(@test1)
  end

  test "should get home" do
    get :home
    assert_response :success
  end

  test "should get help" do
    get :help
    assert_response :success
  end

  test "should get search" do
    get :search
    assert_response :success
  end
  
  test "should get about" do
    get :about
    assert_response :success
  end
end
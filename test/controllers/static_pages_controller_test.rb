require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  
  include Devise::Test::ControllerHelpers
  
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
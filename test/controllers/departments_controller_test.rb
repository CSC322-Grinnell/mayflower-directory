

class DepartmentsControllerTest < ActionDispatch::IntegrationTest
  # include Devise::Test::IntegrationHelpers

  setup do
    @dea = {
      name: "Drugs Enforcement Administration",
      contact: "Uttam Dhillon",
      description: "The only things that can legally smoke are our M4s and MK5"
    }
  end

  test "should load departments landing page as user" do
    login_as(users(:normal))
    get departments_path
    assert_response :sucess
  end

  test "should load departments landing page as admin" do
    login_as(users(:admin))
    get departments_path
    assert_response :sucess
  end







end

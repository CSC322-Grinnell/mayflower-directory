

class DepartmentsControllerTest < ActionDispatch::IntegrationTest
  # include Devise::Test::IntegrationHelpers
  # ref: https://guides.rubyonrails.org/v5.0/testing.html#the-low-down-on-fixtures

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

  test "should show all departments on landing page as user" do

  end

  test "should show all departments on landing page as admin" do

  end

  test "should allow admin create new department" do

  end

  test "should not allow user create new department" do

  end

  test "should allow admin edit new department" do

  end

  test "should not allow user edit new department" do

  end

  test "should allow admin remove department" do

  end

  test "should not allow user remove department" do

  end

  test "should redirect admin to department after edit" do

  end

  test "should redirect admin to department after new" do

  end

  test "should redirect admin to department after remove" do

  end

  test "should edit page successfully as amin" do

  end

  test "should load each departmennt correctly" do

  end





end

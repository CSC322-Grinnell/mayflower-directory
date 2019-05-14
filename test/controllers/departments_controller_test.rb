

class DepartmentsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  # ref: https://guides.rubyonrails.org/v5.0/testing.html#the-low-down-on-fixtures
  # ref: https://github.com/CSC322-Grinnell/mayflower-directory/blob/2644c6f5ac0b4e3bcd93061dabc0e6950a5687be/test/controllers/profiles_controller_test.rb

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
    assert_response :success
  end

  test "should load departments landing page as admin" do
    login_as(users(:admin))
    get departments_path
    assert_response :success
  end


  test "should allow admin create new department" do
    login_as(users(:admin))
    # TODO: departments new path
    get new_department_path
    assert_response :success
  end

  test "should not allow user create new department" do
    login_as(users(:normal))

    get new_department_path
    follow_redirect!
    assert_equal root_path, path
  end

  test "should allow admin edit department" do
    login_as(users(:admin))
    department = departments(:irs)

    put department_path(department), params: { department: @dea }
    department.reload

    @dea.each do |key, value|
      assert_equal value, department[key]
    end
  end

  test "should not allow user edit a department" do
    login_as(users(:normal))
    department = departments(:irs)
    old_attributes = department.attributes

    put department_path(department), params: { department: @dea }
    department.reload
    # maybe this will throw an error before assertion

    assert_equal old_attributes, department.attributes 
  end

  test "should allow admin remove a department" do
    login_as(users(:admin))

    assert_difference -> {Department.all.count }, -1 do
      delete department_path(departments(:irs))
    end
  end

  test "should not allow user remove department" do
    login_as(users(:normal))

    # TODO: fix failure
    assert_difference -> {Department.all.count }, 0 do
      delete department_path(departments(:irs))
    end
  end

  test "should redirect admin to department after editing a department" do
    login_as(users(:admin))
    put department_path(departments(:faa)), params: { department: @dea}

    assert_response :redirect
    follow_redirect!
    assert_equal department_path(departments(:faa)), path
  end

  test "should redirect admin to department after new" do
    login_as(users(:admin))

    assert_difference -> { Department.all.count }, 1 do
      post departments_path, params: { department: @dea }
    end
  end

  test "should redirect admin to department after remove" do
    login_as(users(:admin))

    delete department_path(departments(:irs))
    follow_redirect!
    assert_equal departments_path, path
  end

  test "should load each departmennt correctly" do
    login_as(users(:normal))

    departments.each do |dept|
      get department_path(departments(dept))
      assert_response :success
    end
  end





end

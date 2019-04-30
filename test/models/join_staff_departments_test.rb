require 'test_helper'

class RelationshipTest < ActiveSupport::TestCase

  def setup
    @relationship = JoinStaffDepartment.new(department_id: department(:dining).id,
                                     staff_id: staff(:cook).id)
  end

  test "should be valid" do
    assert @relationship.valid?
  end

  test "should require a department_id" do
    @relationship.department_id = nil
    assert_not @relationship.valid?
  end

end
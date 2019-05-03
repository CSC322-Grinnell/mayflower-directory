require 'test_helper'

class StaffTest < ActiveSupport::TestCase

  def setup
    @cook = staffs(:cook)
    @clean = staffs(:clean)
    @dining = departments(:faa)
    @irs = departments(:irs)
    @cook.work_for(@dining)
  end
  
  test "should add staff to department" do
    assert_difference -> {@dining.staffs.count}, 1 do
      @clean.work_for(@dining)
    end
  end
  
  test "should remove staff from a department" do
    assert_difference -> { @dining.staffs.count }, -1 do
      @cook.remove_from(@dining)
    end 
  end
  
  test "destroy staff should remove them from department" do
    assert_difference -> { @dining.staffs.count }, -1 do
      @cook.destroy
    end
  end
  
end
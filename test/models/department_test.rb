require 'test_helper'

class DepartmentTest < ActiveSupport::TestCase
  
  def setup
    @cook = staffs(:cook)
    @clean = staffs(:clean)
    @dining = departments(:faa)
    @irs = departments(:irs)
    @cook.work_for(@dining)
  end
  
  test "destroy staff should remove them from department" do
    assert_difference -> {@cook.departments.count}, -1 do
      @dining.destroy
    end
  end
    
end
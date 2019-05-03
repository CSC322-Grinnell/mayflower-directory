class JoinStafffDepartmentController < ApplicationController
  before_action :admin_user
  
  def create(department)
    
  end
  
  def destroy(staff)
    @staff = JoinStaffDepartment.find(params[:department_id]).staff
    
  end
  
end
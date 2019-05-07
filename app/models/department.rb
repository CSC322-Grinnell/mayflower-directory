class Department < ApplicationRecord
    has_many :join_staff_departments, foreign_key: :department_id, 
                                    dependent: :destroy 
    has_many :staffs, through: :join_staff_departments
                        
    has_many :services, dependent: :destroy
    accepts_nested_attributes_for :services, reject_if: lambda {|attributes| attributes['content'].blank?}, allow_destroy: true
<<<<<<< HEAD

    def add_staff(staff)
        staffs << staff
    end 
    
    def has_staff?(staff)
        staffs.include?(staff)
    end
  
    def remove_staff(staff)
        if has_staff?(staff)
            staffs.delete(staff)
        else 
        puts "Staff does not work under this department"
        end
    
    end
=======
    
    mount_uploader :picture, DepartmentPictureUploader
>>>>>>> 219b83d89a1e22b39603a7da4c31777f26199145
end

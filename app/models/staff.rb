class Staff < ApplicationRecord
  has_many :join_staff_departments, foreign_key: :staff_id, 
                                    dependent: :destroy
  has_many :departments, through: :join_staff_departments 
                        
  def work_for(department)
    departments << department 
  end
  
  def work_for?(department)
    departments.include?(department)
  end
  
  def remove_from(department)
    if work_for?(department)
      departments.delete(department)
    else 
      puts "Staff does not work under this department"
    end
    
  end
end

class Staff < ApplicationRecord
  has_many :departments, through: :join_staff_departments, 
                        foreign_key: :staff_id, 
                        dependent: :destroy
end

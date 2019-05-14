class JoinStaffDepartment < ApplicationRecord
  belongs_to :department
  belongs_to :staff
  validates :department_id, presence: true
end

class Department < ApplicationRecord
    has_many :staffs, through: :join_staff_departments, 
                        foreign_key: :staff_id, 
                        dependent: :destroy
    has_many :services, dependent: :destroy
    accepts_nested_attributes_for :services, reject_if: lambda {|attributes| attributes['content'].blank?}, allow_destroy: true
    accepts_nested_attributes_for :staffs, allow_destroy: True
end

class Department < ApplicationRecord
    has_many :services, dependent: :destroy
    accepts_nested_attributes_for :services, reject_if: lambda {|attributes| attributes[:content].blank?}
end

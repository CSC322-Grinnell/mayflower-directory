class Department < ApplicationRecord
    has_many :services, dependent: :destroy
end

class CreateJoinStaffDepartments < ActiveRecord::Migration[5.0]
  def change
    create_table :join_staff_departments do |t|
      t.integer :department_id
      t.integer :staff_id

      t.timestamps
    end
    add_index :join_staff_departments, :department_id
    add_index :join_staff_departments, :staff_id
    add_index :join_staff_departments, [:department_id, :staff_id], unique: true
  end
end

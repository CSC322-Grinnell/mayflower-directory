class AddPictureToDepartments < ActiveRecord::Migration[5.0]
  def change
    add_column :departments, :picture, :string
  end
end

class AddTitleToStaffs < ActiveRecord::Migration[5.0]
  def change
    add_column :staffs, :title, :string
  end
end

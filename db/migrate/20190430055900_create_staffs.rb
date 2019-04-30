class CreateStaffs < ActiveRecord::Migration[5.0]
  def change
    create_table :staffs do |t|
      t.string :first_name
      t.string :last_name
      t.string :nickname
      t.string :landline
      t.string :cell
      t.string :email
      t.string :address
      t.text   :bio

      t.timestamps
    end
  end
end

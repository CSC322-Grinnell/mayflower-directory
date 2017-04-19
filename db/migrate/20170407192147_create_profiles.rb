class CreateProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :profiles do |t|
      t.string :first_name
      t.string :last_name
      t.string :nickname
      t.string :landline
      t.string :cell
      t.string :email
      t.string :address
      t.string :neighborhood
      t.string :spouse

      t.timestamps
    end
  end
end

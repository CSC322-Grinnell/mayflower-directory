class CreateServices < ActiveRecord::Migration[5.0]
  def change
    create_table :services do |t|
      t.text :content
      t.integer :department_id

      t.timestamps
    end
  end
end

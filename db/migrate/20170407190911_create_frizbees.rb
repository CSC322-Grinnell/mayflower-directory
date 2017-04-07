class CreateFrizbees < ActiveRecord::Migration[5.0]
  def change
    create_table :frizbees do |t|
      t.string :name

      t.timestamps
    end
  end
end

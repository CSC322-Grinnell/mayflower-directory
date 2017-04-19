class AddCellToProfiles < ActiveRecord::Migration[5.0]
  def change
    add_column :profiles, :cell, :string
  end
end

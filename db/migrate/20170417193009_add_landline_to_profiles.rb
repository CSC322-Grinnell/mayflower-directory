class AddLandlineToProfiles < ActiveRecord::Migration[5.0]
  def change
    add_column :profiles, :landline, :string
  end
end

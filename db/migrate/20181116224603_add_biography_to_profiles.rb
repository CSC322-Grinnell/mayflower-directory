class AddBiographyToProfiles < ActiveRecord::Migration[5.0]
  def change
    add_column :profiles, :biography, :string
  end
end

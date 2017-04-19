class AddNeighborhoodToProfiles < ActiveRecord::Migration[5.0]
  def change
    add_column :profiles, :neighborhood, :string
  end
end

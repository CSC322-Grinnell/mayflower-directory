class AddSpouseToProfiles < ActiveRecord::Migration[5.0]
  def change
    add_column :profiles, :spouse, :string
  end
end

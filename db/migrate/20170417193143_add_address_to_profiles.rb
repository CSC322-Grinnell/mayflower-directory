class AddAddressToProfiles < ActiveRecord::Migration[5.0]
  def change
    add_column :profiles, :address, :string
  end
end

class AddEmailToProfiles < ActiveRecord::Migration[5.0]
  def change
    add_column :profiles, :email, :string
  end
end

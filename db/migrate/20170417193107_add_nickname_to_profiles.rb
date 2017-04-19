class AddNicknameToProfiles < ActiveRecord::Migration[5.0]
  def change
    add_column :profiles, :nickname, :string
  end
end

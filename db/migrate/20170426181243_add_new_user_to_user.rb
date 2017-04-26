class AddNewUserToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :newUser, :boolean
  end
end

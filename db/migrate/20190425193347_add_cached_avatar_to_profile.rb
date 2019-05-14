class AddCachedAvatarToProfile < ActiveRecord::Migration[5.0]
  def change
    add_column :profiles, :cached_avatar_url, :string
  end
end

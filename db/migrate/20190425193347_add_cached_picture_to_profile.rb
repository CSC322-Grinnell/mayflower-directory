class AddCachedPictureToProfile < ActiveRecord::Migration[5.0]
  def change
    add_column :profiles, :cached_picture_url, :string
  end
end

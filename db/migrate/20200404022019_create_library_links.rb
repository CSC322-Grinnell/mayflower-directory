class CreateLibraryLinks < ActiveRecord::Migration[5.0]
  def change
    create_table :library_links do |t|
      t.string :list_by_title
      t.string :list_by_author
      t.string :browing_collection

      t.timestamps
    end
  end
end

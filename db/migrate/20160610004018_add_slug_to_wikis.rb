class AddSlugToWikis < ActiveRecord::Migration
  def change
    add_column :wikis, :slug, :string
    change_column :wikis, :slug, :string, null: false
    add_index :wikis, :slug, unique: true
  end
end

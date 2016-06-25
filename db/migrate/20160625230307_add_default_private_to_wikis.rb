class AddDefaultPrivateToWikis < ActiveRecord::Migration
  def up
  	change_column :wikis, :private, :boolean, null: false, default: false
  end

  def down
  	change_column :wikis, :private, :boolean, null: false
  end
end

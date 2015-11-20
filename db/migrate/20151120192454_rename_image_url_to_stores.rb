class RenameImageUrlToStores < ActiveRecord::Migration
  def change
    rename_column :stores, :image_url, :image
  end
end

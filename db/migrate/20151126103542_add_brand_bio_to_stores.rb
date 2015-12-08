class AddBrandBioToStores < ActiveRecord::Migration
  def change
    add_column :stores, :brand_bio, :string
  end
end

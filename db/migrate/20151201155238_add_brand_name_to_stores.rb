class AddBrandNameToStores < ActiveRecord::Migration
  def change
    add_column :stores, :brand_name, :string
  end
end

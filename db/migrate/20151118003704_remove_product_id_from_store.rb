class RemoveProductIdFromStore < ActiveRecord::Migration
  def change
    remove_column :stores, :product_id, :string
  end
end

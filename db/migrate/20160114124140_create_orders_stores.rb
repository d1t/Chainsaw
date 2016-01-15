class CreateOrdersStores < ActiveRecord::Migration
  def self.up
    create_table :orders_stores, id: false do |t|
    	t.references :order, null: false
      	t.references :store, null: false
   end

    # Add an unique index for better join speed!
    add_index(:orders_stores, [:order_id, :store_id], :unique => true)
  end

  def self.down
    drop_table :orders_stores
  end
end

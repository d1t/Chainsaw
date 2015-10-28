class CreateStores < ActiveRecord::Migration
  def change
    create_table :stores do |t|
      t.string :product_id
      t.integer :product_quantity
      t.integer :price
      t.string :image_url

      t.timestamps null: false
    end
  end
end

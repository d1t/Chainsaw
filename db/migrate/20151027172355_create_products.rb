class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title
      t.text :description
      t.string :quantity
      t.string :category
      t.string :subcategory
      t.string :image
      t.integer :price

      t.timestamps null: false
    end
  end
end

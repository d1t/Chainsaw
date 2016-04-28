class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :line_one
      t.string :line_two
      t.string :town
      t.string :county
      t.string :postcode
      t.belongs_to :order, index: true
      t.belongs_to :user, index: true
      
      t.timestamps null: false
    end
  end
end

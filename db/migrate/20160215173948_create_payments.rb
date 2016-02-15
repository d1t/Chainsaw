class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.integer :order_id
      t.integer :pay_id
      t.integer :user_id

      t.timestamps null: false
    end
    add_index :payments, :order_id
    add_index :payments, :pay_id
    add_index :payments, :user_id
  end
end

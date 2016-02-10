class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :credit_card_id
      t.string :external_customer_id
      t.string :ip_address
      t.integer :user_id
      t.string :number
      t.string :expire_year
      t.string :expire_month

      t.timestamps null: false
    end
    add_index :cards, :user_id
  end
end

class AddDeliveryPriceToProducts < ActiveRecord::Migration
  def change
    add_column :products, :delivery_price, :float
  end
end

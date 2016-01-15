class AddOrderToStore < ActiveRecord::Migration
  def change
    add_reference :stores, :order, index: true, foreign_key: true
  end
end

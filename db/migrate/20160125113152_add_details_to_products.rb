class AddDetailsToProducts < ActiveRecord::Migration
  def change
    add_column :products, :rrp, :integer
    add_column :products, :size, :string
    add_column :products, :color, :string
  end
end

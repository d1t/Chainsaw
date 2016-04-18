class AddSecimageToProducts < ActiveRecord::Migration
  def change
    add_column :products, :secimage, :string
  end
end

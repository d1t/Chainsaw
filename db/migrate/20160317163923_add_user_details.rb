class AddUserDetails < ActiveRecord::Migration
  def change
  	add_column :users, :image, :string
  	add_column :users, :bio, :string
  	add_column :users, :name, :string
  end
end
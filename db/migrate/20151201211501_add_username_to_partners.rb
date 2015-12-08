class AddUsernameToPartners < ActiveRecord::Migration
  def change
    add_column :partners, :username, :string
  end
end

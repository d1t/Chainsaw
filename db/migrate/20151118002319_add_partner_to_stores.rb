class AddPartnerToStores < ActiveRecord::Migration
  def change
    add_reference :stores, :partner, index: true, foreign_key: true
  end
end

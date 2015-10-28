class Product < ActiveRecord::Base
belongs_to :store, polymorphic: true

accepts_nested_attributes_for :store
end

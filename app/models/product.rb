class Product < ActiveRecord::Base
belongs_to :store, polymorphic: true
mount_uploader :image, ImageUploader

accepts_nested_attributes_for :store
end

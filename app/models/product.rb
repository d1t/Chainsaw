class Product < ActiveRecord::Base
  belongs_to :store
  mount_uploader :image, ImageUploader

  accepts_nested_attributes_for :store

  validates :store, presence: true
end

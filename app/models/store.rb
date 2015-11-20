class Store < ActiveRecord::Base
  has_many :products
  belongs_to :partner
  mount_uploader :image, ImageUploader
end

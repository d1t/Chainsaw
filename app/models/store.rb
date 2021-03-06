class Store < ActiveRecord::Base
  has_many :products
  belongs_to :partner
  mount_uploader :image, ImageUploader

  validates :brand_bio, length: { maximum: 140 }

  validates_integrity_of  :image
  validates_processing_of :image

  def remove_image=(val)
    image_will_change! if val
    super
  end
end

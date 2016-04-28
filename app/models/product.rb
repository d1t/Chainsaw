class Product < ActiveRecord::Base

  has_many :line_items
  has_many :orders, through: :line_items
  before_destroy :ensure_not_referenced_by_any_line_item

  belongs_to :store
  mount_uploader :image, ImageUploader
  mount_uploader :secimage, ImageUploader

  validates :store, presence: true
  validates :delivery_price, presence: true

  validate :product_count_within_limit, :on => :create

  CATEGORY = ["Clothing","Accessories"]
  SUB_CATEGORY = ["Tops","Bottoms","Dresses","Jumpsuits","Shoes/Heels","Bags","Coats & Jackets","Jumpers/Knitwear","Scarves","Ties"]
  SIZE_OPTIONS = ["UK - 2","UK - 4","UK - 6","UK - 8","Extra Small","Small","Medium","Large"]
  COLOR_OPTIONS = ["White","Black","Blue","Navy","Green","Yellow","Cream","Brown"].select &:present?



  def product_count_within_limit
    if self.store.products(:reload).count >= 9
      errors.add(:base, "Exceeded product limit")
    end
  end

  private

  # ensure that there are no line items referencing this product
  def ensure_not_referenced_by_any_line_item
  	if line_items.empty?
  		return true
  	else
  		errors.add(:base, 'Line Items present')
  		return false
  	end
  end

end

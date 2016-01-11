class Product < ActiveRecord::Base
<<<<<<< HEAD
  has_many :line_items
  has_many :orders, through: :line_items
  before_destroy :ensure_not_referenced_by_any_line_item
=======
>>>>>>> 635a7b70783a009bb6b645f8455131233d3b78ff
  belongs_to :store
  mount_uploader :image, ImageUploader

  validates :store, presence: true
<<<<<<< HEAD
  validate :product_count_within_limit, :on => :create

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
=======
>>>>>>> 635a7b70783a009bb6b645f8455131233d3b78ff
end

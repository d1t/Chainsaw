class Product < ActiveRecord::Base

  has_many :line_items
  has_many :orders, through: :line_items
  before_destroy :ensure_not_referenced_by_any_line_item

  belongs_to :store
  mount_uploader :image, ImageUploader

  validates :store, presence: true

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

end

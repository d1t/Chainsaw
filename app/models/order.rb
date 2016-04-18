class Order < ActiveRecord::Base
	PAYMENT_TYPES = [ "Visa Debit", "Mastercard", "Discover" ]
	has_many :line_items, dependent: :destroy
	has_many :payments
	has_and_belongs_to_many :stores
	validates :name, :address, :email, presence: true
	validates :pay_type, inclusion: PAYMENT_TYPES



	def add_line_items_from_cart(cart)
		cart.line_items.each do |item|
			item.cart_id = nil
			line_items << item
		end
	end
end

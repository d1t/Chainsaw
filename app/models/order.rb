class Order < ActiveRecord::Base
	PAYMENT_TYPES = [ "Visa Debit", "Mastercard", "Discover" ]
	has_many :line_items, dependent: :destroy
	has_many :payments
	has_and_belongs_to_many :stores
	has_one :address
	validates :name, :email, presence: true
	validates :pay_type, inclusion: PAYMENT_TYPES



	def add_line_items_from_cart(cart)
		cart.line_items.each do |item|
			item.cart_id = nil
			line_items << item
		end
	end

	 def self.user
 		@usr = @user.partner
 	end
end

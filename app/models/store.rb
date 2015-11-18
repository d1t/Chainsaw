class Store < ActiveRecord::Base
  has_many :products
  belongs_to :partner

  validates :partner_id, presence: true
end

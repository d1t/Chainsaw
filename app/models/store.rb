class Store < ActiveRecord::Base
  has_many :products
  belongs_to :partner

  validates :partner, presence: true
end

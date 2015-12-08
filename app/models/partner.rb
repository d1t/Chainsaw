class Partner < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :store
  has_many :products, through: :store

  after_initialize :add_store

  accepts_nested_attributes_for :store

  validates_uniqueness_of :username

private

  def add_store
    self.build_store unless store
  end
end

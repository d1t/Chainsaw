class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :authentication_keys => [:username]
  enum role: %i[ customer partner admin ]

  has_one :store #need to create a relation to store
  has_many :products, through: :store
  has_many :orders, through: :store
  has_many :cards, dependent: :destroy

  after_create :default_store

  accepts_nested_attributes_for :store
  accepts_nested_attributes_for :cards

  validates :username, presence: true, uniqueness: { case_sensitive: false }
  validates :role, presence: true

  # this should be send by devise automatically, need to check that
  # after_create { SignupNotifier.confirmation_mail(self).deliver }

  def to_param
    username
  end

  def customer?
    role == 'customer'
  end

  def partner?
    role == 'partner'
  end

  def admin?
    role == 'admin'
  end

  private

    def default_store
      self.create_store if partner?
    end

end

class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :invitable,
         :authentication_keys => [:username]
  enum role: %i[ customer partner admin ]

  has_one :store, dependent: :destroy #need to create a relation to store
  has_many :products, through: :store
  has_many :orders, through: :store
  has_many :cards, dependent: :destroy
  has_many :payments
  has_one :cart

  after_create :default_store, :set_partner_role

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

  def add_products_from_session cart_id
    session_cart = Cart.find cart_id if cart_id
    if cart && session_cart
      session_cart.line_items.each{ |li| self.cart.line_items << li }
      session_cart.reload
      session_cart.destroy
    elsif session_cart
      self.cart = session_cart
    end
  end

  private

    def default_store
      self.create_store if partner?
    end

    def set_partner_role
      self.role = 'partner' if invitation_created_at
      p '~'*90
      p self.role
      save(validate: false)
    end

end

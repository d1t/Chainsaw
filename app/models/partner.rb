class Partner < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :validatable,
         :recoverable, :rememberable, :trackable, 
         :authentication_keys => [:username]

  has_one :store
  has_many :products, through: :store

  after_initialize :add_store

  accepts_nested_attributes_for :store
  
  
  validates :username,
  :presence => true,
  :uniqueness => {
    :case_sensitive => false
  }

  #signup_notifier mailer
  after_create { SignupNotifier.confirmation_mail(self).deliver }

#  def send_confirmation_mail
#    SignupNotifier.confirmation(self).deliver
#  end
  
def to_param
  username
end

private

  def add_store
    self.build_store unless store
  end
end

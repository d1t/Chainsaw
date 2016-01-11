class Partner < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
<<<<<<< HEAD
  devise :database_authenticatable, :registerable, :validatable,
         :recoverable, :rememberable, :trackable, 
         :authentication_keys => [:username]
=======
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
>>>>>>> 635a7b70783a009bb6b645f8455131233d3b78ff

  has_one :store
  has_many :products, through: :store

  after_initialize :add_store

  accepts_nested_attributes_for :store
<<<<<<< HEAD
  
  
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
=======
>>>>>>> 635a7b70783a009bb6b645f8455131233d3b78ff

private

  def add_store
    self.build_store unless store
  end
end

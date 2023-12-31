class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # before_validation :check_current_pass, on: :update

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  enum :gender, [:male,:female],default: :male

  has_one_attached :user_avatar, dependent: :destroy
  has_many :addresses, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_one :wish_list, dependent: :destroy
  has_one :cart,dependent: :destroy
  validates :first_name, :last_name, presence: true
  validates_uniqueness_of :username , case_sensitive: false 
  after_create :welcome_send
  before_validation :generate_username, on: :create
  
  

   def welcome_send
      UserMailer.welcome_mail(self).deliver_now
   end

   def generate_username
       a = SecureRandom.random_number(999)
       self.username = self.first_name + a.to_s rescue nil?
   end

end

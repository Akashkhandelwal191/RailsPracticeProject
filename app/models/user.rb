class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  enum :gender, [:male,:female],default: :male

  has_one_attached :user_avatar,dependent: :destroy
  has_many :addresses,dependent: :destroy
  has_one :wish_list,dependent: :destroy
 
  validates :username,:first_name,:last_name,:gender,:mobile_number,presence:true
  validates :username,uniqueness: true
  after_create :welcome_send


   def welcome_send
      UserMailer.welcome_mail(self).deliver_now
   end

end

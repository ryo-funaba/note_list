class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  
  has_one_attached :image 
  has_many :reviews, dependent: :delete_all

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
      
  # validates :nickname, presence: true
  validates :nickname, presence: true, length: { minimum: 1,　maximum: 10 }
  validates :image, presence: true
  
  def thumbnail
    return self.avatar.variant(resize: '50x50')
  end
  
end

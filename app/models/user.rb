class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]
         
  validates :name,  presence:   true
  validates :email, presence:   true
  validates :email, uniqueness: true
  has_many  :trips
  has_many  :objectives, through: :trips

end

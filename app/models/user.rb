class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :games
  has_many :replies
  has_many :posts

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end

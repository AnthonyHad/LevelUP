class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :games, dependent: :destroy
  has_many :replies
  has_many :posts
  has_many :orders
  has_one_attached :photo, dependent: :destroy
  has_many :followings

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end

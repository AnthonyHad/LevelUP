class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :games, dependent: :destroy
  has_many :replies, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_one_attached :photo, dependent: :destroy
  has_many :followings, dependent: :destroy

  acts_as_voter

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end

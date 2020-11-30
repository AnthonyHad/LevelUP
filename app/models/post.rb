class Post < ApplicationRecord
  belongs_to :user
  belongs_to :game
  has_many :replies, dependent: :destroy
  has_one_attached :photo
  

  acts_as_votable
end

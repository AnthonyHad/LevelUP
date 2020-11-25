class Post < ApplicationRecord
  belongs_to :user
  belongs_to :game
  has_many :replies, dependent: :destroy
end

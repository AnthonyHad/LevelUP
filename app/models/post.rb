class Post < ApplicationRecord
  belongs_to :user
  belongs_to :game, dependent: :destroy
  has_many :replies
end

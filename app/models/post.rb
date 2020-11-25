class Post < ApplicationRecord
  belongs_to :user
  belongs_to :game, dependent: :destroy
  has_many :replies
  has_one_attached :photo

end

class Game < ApplicationRecord
  belongs_to :user
  has_many :posts, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :games_platforms, dependent: :destroy
  has_many :platforms, through: :games_platforms
  has_many_attached :photos
  monetize :price_cents
  has_many :followings, dependent: :destroy
  has_many :orders, dependent: :destroy
  validates :title, presence: true
  validates :description, presence: true
  validates :category, presence: true
  validates :price, presence: true


  include PgSearch::Model
  pg_search_scope :search_by_title_and_description_and_category,
   against: [:title, :description, :category],
   using: {
    tsearch: {prefix: true}
   }

  def increase_visit
   self.visit_counter += 1
   save!
  end
end

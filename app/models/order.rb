class Order < ApplicationRecord
  belongs_to :user
  belongs_to :game
  monetize :amount_cents
end

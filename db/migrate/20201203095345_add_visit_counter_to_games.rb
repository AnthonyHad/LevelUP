class AddVisitCounterToGames < ActiveRecord::Migration[6.0]
  def change
    add_column :games, :visit_counter, :integer, default: 0
  end
end

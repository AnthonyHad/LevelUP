class AddPlatformsToGames < ActiveRecord::Migration[6.0]
  def change
    add_column :games, :platforms, :string
  end
end

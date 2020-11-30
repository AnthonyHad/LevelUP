class ChangePlatformsToPlatform < ActiveRecord::Migration[6.0]
  def change
    rename_column :games, :platforms, :platform
  end
end

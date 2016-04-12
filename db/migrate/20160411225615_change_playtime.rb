class ChangePlaytime < ActiveRecord::Migration
  def change
    rename_column :playtimes, :game, :game_id
  end
end

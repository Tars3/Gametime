class NewPlaytimes < ActiveRecord::Migration
  def change
    #remove column game_id
    remove_column :playtimes, :game_id
    #add reference
    add_reference :playtimes, :game, index:true
  end
end

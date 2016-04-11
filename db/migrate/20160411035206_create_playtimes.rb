class CreatePlaytimes < ActiveRecord::Migration
  def change
    create_table :playtimes do |t|
      t.datetime :time
      t.string :game
      t.integer :num_of_players

      t.timestamps null: false
    end
  end
end

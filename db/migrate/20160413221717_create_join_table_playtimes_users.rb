class CreateJoinTablePlaytimesUsers < ActiveRecord::Migration
  def change
    create_join_table :playtimes, :users do |t|
      # t.index [:playtime_id, :user_id]
      # t.index [:user_id, :playtime_id]
    end
  end
end

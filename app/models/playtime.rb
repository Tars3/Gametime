class Playtime < ActiveRecord::Base
  has_many :users
  belongs_to :game
end

class User < ActiveRecord::Base
  has_and_belongs_to_many :playtimes
  has_many :games

  has_secure_password
    validates :email, presence: true, uniqueness: {case_sensitive: false}
    validates :gamertag, presence: true
end

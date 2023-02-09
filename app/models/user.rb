class User < ApplicationRecord
  has_many :favorites
  has_many :games, through: :favorites
  has_secure_password
  validates :email, presence: true, uniqueness: true
  has_many :reviews
end

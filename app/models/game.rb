class Game < ApplicationRecord
  has_many :users, through: :favorites
end

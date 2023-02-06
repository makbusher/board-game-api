class AddPlayersToGames < ActiveRecord::Migration[7.0]
  def change
    add_column :games, :players, :string
  end
end

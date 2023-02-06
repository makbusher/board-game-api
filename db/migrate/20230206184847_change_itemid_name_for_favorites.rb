class ChangeItemidNameForFavorites < ActiveRecord::Migration[7.0]
  def change
    rename_column :favorites, :item_id, :game_id
  end
end

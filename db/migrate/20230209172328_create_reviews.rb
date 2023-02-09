class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.integer :rating
      t.text :description
      t.integer :game_id
      t.integer :user_id

      t.timestamps
    end
  end
end

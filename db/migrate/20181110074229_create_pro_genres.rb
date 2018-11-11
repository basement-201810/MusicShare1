class CreateProGenres < ActiveRecord::Migration[5.2]
  def change
    create_table :pro_genres do |t|
    	t.string :pro_genre_name, null: false
      t.timestamps
    end
  end
end

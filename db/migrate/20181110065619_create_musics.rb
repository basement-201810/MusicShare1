class CreateMusics < ActiveRecord::Migration[5.2]
  def change
    create_table :musics do |t|
    	t.string :music_name, null: false
    	t.integer :music_disk_number, null: false
    	t.integer :product_id, null: false
    	t.integer :music_number, null: false
      t.timestamps
    end
  end
end

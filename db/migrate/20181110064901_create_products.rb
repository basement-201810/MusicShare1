class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
    	t.string :pro_image_id
    	t.integer :pro_price, null: false
    	t.integer :pro_genre_id, null: false
    	t.datetime :pro_date, null: false
    	t.integer :pro_amount, null: false
    	t.string :pro_title, null: false
    	t.integer :pro_label_id, null: false
    	t.string :pro_artist, null: false
    	t.boolean :pro_status, null: false, defalut: true
      t.timestamps
    end
  end
end

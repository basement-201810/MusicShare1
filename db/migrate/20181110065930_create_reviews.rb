class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
    	t.text :review_body
    	t.integer :user_id, null: false
    	t.integer :product_id, null: false
      t.integer :purchase_item_id, null: false
    	t.integer :review_star
    	t.boolean :review_status, null: false, defalut: true
      t.timestamps
    end
  end
end

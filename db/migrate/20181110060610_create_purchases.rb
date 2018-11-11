class CreatePurchases < ActiveRecord::Migration[5.2]
  def change
    create_table :purchases do |t|
    	t.integer :user_id, null: false
    	t.integer :get_points
    	t.integer :pay_points
    	t.datetime :date, null: false
    	t.integer :status, null: false, default: 0
    	t.integer :cart_id, null: false
    	t.integer :pur_total, null: false
    	t.string :pay, null: false
    	t.string :pur_name, null: false
    	t.string :pur_name_kana, null: false
    	t.string :pur_email, null: false
    	t.string :pur_address, null: false
    	t.string :pur_post_code, null: false
    	t.string :pur_tell, null: false
     	t.timestamps
    end
  end
end

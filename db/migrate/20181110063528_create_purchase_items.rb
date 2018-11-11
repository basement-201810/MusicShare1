class CreatePurchaseItems < ActiveRecord::Migration[5.2]
  def change
    create_table :purchase_items do |t|
    	t.integer :purchase_id, null: false
    	t.integer :cart_item_id, null: false
    	t.integer :sub_total, null: false
    	t.integer :amount, null: false
      t.timestamps
    end
  end
end

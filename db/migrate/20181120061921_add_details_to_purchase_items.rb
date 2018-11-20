class AddDetailsToPurchaseItems < ActiveRecord::Migration[5.2]
  def change
    add_column :purchase_items, :title, :string
    add_column :purchase_items, :artist, :string
    add_column :purchase_items, :image_id, :string
    add_column :purchase_items, :product_id, :integer
  end
end

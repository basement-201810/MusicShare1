class ChangeDatatypePayOfPurchases < ActiveRecord::Migration[5.2]
  def change
  	change_column :purchases, :pay, :integer, null: false, default: 0
  end
end

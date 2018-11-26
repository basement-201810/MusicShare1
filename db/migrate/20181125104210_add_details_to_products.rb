class AddDetailsToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :average_score, :float
  end
end

class CreateProLabels < ActiveRecord::Migration[5.2]
  def change
    create_table :pro_labels do |t|
    	t.string :pro_label_name, null: false
      t.timestamps
    end
  end
end

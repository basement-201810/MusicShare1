class AddColumnToReviews < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :first_review, :boolean, default: true
  end
end

class AddReviewStarToReviews < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :review_star, :integer, null: false, default: 0
  end
end

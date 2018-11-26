class RemoveReviewStarToReviews < ActiveRecord::Migration[5.2]
  def change
  	remove_column :reviews, :review_star, :integer
  end
end

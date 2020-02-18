class RemoveUrlFromReviews < ActiveRecord::Migration[5.2]
  def change
    remove_column :reviews, :url, :string
  end
end

class RenameProductIdToReviews < ActiveRecord::Migration[5.2]
  def change
    rename_column :reviews, :product_id, :note_id
  end
end

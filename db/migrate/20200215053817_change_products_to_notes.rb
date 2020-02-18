class ChangeProductsToNotes < ActiveRecord::Migration[5.2]
  def change
    rename_table :products, :notes
  end
end

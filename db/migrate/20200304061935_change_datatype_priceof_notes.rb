class ChangeDatatypePriceofNotes < ActiveRecord::Migration[5.2]
  def change
    change_column :notes, :price, :string
  end
end

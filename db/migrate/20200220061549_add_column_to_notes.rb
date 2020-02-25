class AddColumnToNotes < ActiveRecord::Migration[5.2]
  def change
    remove_column :notes, :image_url, :string
    add_column :notes, :title_image, :string
    add_column :notes, :creater_image, :string
    add_column :notes, :like, :integer
    add_column :notes, :price, :integer
  end
end

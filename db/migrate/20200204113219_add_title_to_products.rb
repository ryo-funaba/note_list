class AddTitleToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :title, :string
    add_column :products, :creater, :string
    add_column :products, :image_url, :string
  end
end

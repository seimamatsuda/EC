class AddCategoryCdToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :category_cd, :string
  end
end

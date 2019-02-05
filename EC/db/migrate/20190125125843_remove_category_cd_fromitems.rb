class RemoveCategoryCdFromitems < ActiveRecord::Migration[5.2]
  def change
  	remove_column :items, :category_cd
  end
end

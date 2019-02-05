class RenameBrandNameColumnToItems < ActiveRecord::Migration[5.2]
  def change
  	rename_column :items, :brand_name, :brand_cd
  end
end

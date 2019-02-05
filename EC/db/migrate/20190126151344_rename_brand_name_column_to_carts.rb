class RenameBrandNameColumnToCarts < ActiveRecord::Migration[5.2]
  def change
  	rename_column :carts, :brand_name, :brand_cd
  end
end

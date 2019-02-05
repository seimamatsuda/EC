class RenameBrandNameColumnToOrderDetails < ActiveRecord::Migration[5.2]
  def change
  	rename_column :order_details, :brand_name, :brand_cd
  end
end

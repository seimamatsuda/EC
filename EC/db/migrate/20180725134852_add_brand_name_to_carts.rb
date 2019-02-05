class AddBrandNameToCarts < ActiveRecord::Migration[5.2]
  def change
    add_column :carts, :brand_name, :string
  end
end

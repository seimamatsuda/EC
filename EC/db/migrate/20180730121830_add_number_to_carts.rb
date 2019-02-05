class AddNumberToCarts < ActiveRecord::Migration[5.2]
  def change
    add_column :carts, :number, :integer
  end
end

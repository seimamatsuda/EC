class AddOrderNoToOrderDetails < ActiveRecord::Migration[5.2]
  def change
    add_column :order_details, :order_no, :integer
  end
end

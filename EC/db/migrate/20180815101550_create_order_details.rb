class CreateOrderDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :order_details do |t|
      t.string :item_cd
      t.string :size
      t.integer :number
      t.integer :total_price

      t.timestamps
    end
  end
end

class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :item_cd
      t.string :item_name
      t.string :image
      t.integer :price
      t.string :item_describe
      t.timestamps
    end
  end
end

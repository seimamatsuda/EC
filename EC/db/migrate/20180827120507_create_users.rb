class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :user_name
      t.string :user_kana_name
      t.string :tel
      t.string :zip
      t.string :pref
      t.string :addr01
      t.string :addr02
      t.string :email
      t.string :password

      t.timestamps
    end
  end
end

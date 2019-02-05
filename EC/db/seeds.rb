# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# coding: utf-8

Category.create(:category_cd => '1', :category_name => 'ALL ITEMS')
Category.create(:category_cd => '2', :category_name => 'TOPS')
Category.create(:category_cd => '3', :category_name => 'BOTTOMS')
Category.create(:category_cd => '4', :category_name => 'OUTER')
Category.create(:category_cd => '5', :category_name => 'HAT')
Category.create(:category_cd => '6', :category_name => 'BAG')
Category.create(:category_cd => '7', :category_name => 'SHOES')
Category.create(:category_cd => '8', :category_name => 'ACCESSORIES')
# Brand.create(:brand_cd => '1', :brand_name => 'NEONSIGN')
# Brand.create(:brand_cd => '2', :brand_name => 'SCYE')
# Brand.create(:brand_cd => '3', :brand_name => 'paraboot')
# Brand.create(:brand_cd => '4', :brand_name => 'AURALEE')
# Brand.create(:brand_cd => '5', :brand_name => 'FLAGSTAFF')
# Brand.create(:brand_cd => '6', :brand_name => 'convers')
# Brand.create(:brand_cd => '7', :brand_name => 'URU')

Item.create(:item_cd => '1', :item_name => 'Tシャツ',:image => '1', :price => '5000',:item_describe => '頑丈なTシャツです。', :brand_cd => '1',:category_cd => '2')
Item.create(:item_cd => '2', :item_name => 'スラックス',:image => '2', :price => '15000',:item_describe => 'センタープレスが入っています。', :brand_cd => '2',:category_cd => '3')
Item.create(:item_cd => '3', :item_name => '革靴',:image => '3', :price => '20000',:item_describe => '牛革の革靴です。', :brand_cd => '3',:category_cd => '7')
Item.create(:item_cd => '4', :item_name => 'シャツ',:image => '4', :price => '12000',:item_describe => 'コットン100%です。', :brand_cd => '4',:category_cd => '2')
Item.create(:item_cd => '5', :item_name => 'ジャケット',:image => '5', :price => '19000',:item_describe => 'フォーマルにも使えます。', :brand_cd => '7',:category_cd => '4')
Item.create(:item_cd => '6', :item_name => 'コート',:image => '6', :price => '25000',:item_describe => 'ロングコートです。', :brand_cd => '5',:category_cd => '4')
Item.create(:item_cd => '7', :item_name => 'ニット',:image => '7', :price => '16000',:item_describe => 'ウールのニットです。', :brand_cd => '1',:category_cd => '2')
Item.create(:item_cd => '8', :item_name => 'ダウン',:image => '8', :price => '27000',:item_describe => 'ダウン80%です。', :brand_cd => '2',:category_cd => '4')
Item.create(:item_cd => '9', :item_name => 'スニーカー',:image => '9', :price => '10000',:item_describe => '定番のローカットです。', :brand_cd => '6',:category_cd => '7')
Item.create(:item_cd => '10', :item_name => 'スウェット',:image => '10', :price => '12000',:item_describe => 'ストレッチ素材です。', :brand_cd => '4',:category_cd => '3')
Item.create(:item_cd => '11', :item_name => 'デニム',:image => '11', :price => '13000',:item_describe => 'リジッドです。', :brand_cd => '7',:category_cd => '3')
Item.create(:item_cd => '12', :item_name => 'ロンT',:image => '12', :price => '10000',:item_describe => 'Printが独特です。', :brand_cd => '5',:category_cd => '2')






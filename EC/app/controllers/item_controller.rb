class ItemController < ApplicationController
  def ItemDetail
  	@itemdetails = Item.joins("LEFT JOIN `brands` ON `brands`.`brand_cd` = `items`.`brand_cd`").select("items.*, brands.*").where(item_cd: params[:para]).limit(1)
  	render 'item/itemDetail'
  end
end

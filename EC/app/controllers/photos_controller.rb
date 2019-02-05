# coding: utf-8

class PhotosController < ApplicationController
  def index
		@newItems = Item.joins("LEFT JOIN `brands` ON `brands`.`brand_cd` = `items`.`brand_cd`").select("items.*, brands.*").order("id DESC").limit(8)
    @ranking = 
    OrderDetail.find_by_sql(['
      SELECT *, count(*) 
      FROM order_details
      LEFT JOIN `brands` 
        ON `brands`.`brand_cd` = `order_details`.`brand_cd`
      GROUP BY item_cd 
      ORDER BY count(*) DESC, item_cd ASC
      LIMIT 8
      '])
  end

  def ItemList
  	@items = Item.joins("LEFT JOIN `brands` ON `brands`.`brand_cd` = `items`.`brand_cd`").select("items.*, brands.*")
  	render 'item/itemList'
  end

  def ItemListSearch
    if params[:category_para].present?
      # itemcategory
      @items = Item.where(category_cd: params[:category_para]).joins("LEFT JOIN `brands` ON `brands`.`brand_cd` = `items`.`brand_cd`").select("items.*, brands.*").order("item_cd ASC")
    elsif params[:brand_para].present?
      # brand
      @items = Item.where(brand_cd: params[:brand_para]).joins("LEFT JOIN `brands` ON `brands`.`brand_cd` = `items`.`brand_cd`").select("items.*, brands.*").order("item_cd ASC")
    end
    render 'item/itemList'
  end

  def Category
    @id = params[:para]
    if params[:para].present?
      if params[:para].eql?("ITEMCATEGORY")
        # itemcategory
        @categories = Category.all
        @category = true;
      elsif params[:para].eql?("BRAND")
        # brand
        @categories = Brand.all
        @brand = true;
      end
      render 'category/category'
    end
  end

end

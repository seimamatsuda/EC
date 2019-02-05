class CartController < ApplicationController
	def Cart
	  	# item_idが取得できていれば
	  	if params[:cart].present? && params[:cart][:id].present?
			@id = params[:cart][:id]
			@number = params[:cart][:number]
			# カートに選択した商品がない場合
			if !Cart.exists?(item_cd: @id)
				# Itemsテーブルから選択したIDで商品情報を取得
				@cart = Item.where(item_cd: @id).limit(1)
				# 取得した商品情報をCartテーブルに入れる
				@cart.each do |cart|
					@cart2 = Cart.new(
						item_cd: cart.item_cd, 
						item_name: cart.item_name,
						image: cart.image,
						price: cart.price,
						item_describe: cart.item_describe,
						brand_cd: cart.brand_cd,
						number: @number
						)
				end
				@cart2.save
			end
		end
		CartCall()
		render 'cart/cart'
	end

  # カート商品の削除
  def DeleteCart
  		# item_idが取得できていれば
  		if params[:id].present?
		  	Cart.where(item_cd: params[:id]).destroy_all
		end
		CartCall()
	  	render 'cart/cart'
  end

  # 数量変更
  def ChangeNumber
		sql = "UPDATE carts SET number = " + params[:cart][:number][params[:id]] + " WHERE item_cd = " + params[:cart][:item_cd]
		ActiveRecord::Base.connection.execute(sql)
		CartCall()
		render 'cart/cart'
  end

  # 注文確認画面
  def CartConfirm
		CartCall()
		render 'cart/cartConfirm'
  end

  # 注文完了画面
  def CartDone
	# カートに商品がある場合
	if Cart.exists?
		# 注文番号を生成(初期値1)
		@order_no = 1

		# 最後の注文番号を取得
  		@index = OrderDetail.order("order_no DESC").limit(1)
  		@index.each do |index|
  			@index2 = index.order_no
  		end
  		# 最後の注文番号が取得できていれば、@order_noにその次の番号を上書き
  		if @index2.present?
  			@order_no = @index2.next
  		end

  		# カートに入っている商品をOrderDetailにinsert
  		@carts = Cart.all
  		@carts.each_with_index do |cart, i|
	  		@subtotal = params[:cart][:subtotal]["#{i}"]
	  		@subtotal.slice!("¥")
	  		@subtotal.slice!("-")
			@order = OrderDetail.new(
				item_cd: cart.item_cd,
				size: "M",
				number: cart.number,
				total_price: @subtotal,
				order_no: @order_no,
				item_name: cart.item_name,
				brand_cd: cart.brand_cd,
				price: cart.price,
				image: cart.image,
				)
			@order.save
		end
		# カートの商品削除
		Cart.destroy_all
	end	
		render 'cart/cartDone'
  end
  def CartCall
	@carts = Cart.find_by_sql(['
		SELECT * 
		FROM carts
		LEFT JOIN `brands` 
		ON `brands`.`brand_cd` = `carts`.`brand_cd`
		'])
  end
end

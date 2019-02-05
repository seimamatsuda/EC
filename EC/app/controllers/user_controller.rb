class UserController < ApplicationController
	# ログイン画面の処理
	def User
		if session[:login_flg]
			@login_error = "パスワードが間違っております。"
		elsif session[:login_flg2]
			@login_error = "こちらのメールアドレスはご登録されておりません。"
		end
		# 登録後セッションの削除
		session[:login_flg] = nil
		session[:login_flg2] = nil
		session[:email] = nil
		session[:tel] = nil
		session[:user_name] = nil
		session[:user_kana_name] = nil
		session[:zip] = nil
		session[:pref] = nil
		session[:addr01] = nil
		session[:addr02] = nil
		session[:pass01] = nil
		session[:pass02] = nil
		session[:tel] = nil
		session[:email] = nil
		render 'user/user'
	end

	# 会員登録入力フォームの処理
	def NewAccount

		if session[:email_flg] == true || session[:tel_flg] == true || session[:pass_flg] == true
			@msg = "※入力内容に誤りがあります、もう一度お試しください。"
			if session[:email_flg]
				@email = "※こちらのメールアドレスは既にご登録いただいております。"
			end
			if session[:tel_flg]
				@tel = "※こちらの電話番号は既にご登録いただいております。"
			end
			if session[:pass_flg]
				@pass = "※パスワードとパスワード確認が一致しません"
			end
		end
		session[:tel_flg] = false
		session[:email_flg] = false
		session[:pass_flg] = false
		render 'user/newAccount'
	end

	def NewAccount2
		render 'user/newAccount2'
	end

	def NewAccount3
		# # 既に登録がある場合
		if User.exists?(email: session[:email]) || User.exists?(tel: session[:tel])
			@msg = "※こちらのアカウントは既にご登録いただいております。"
		# 登録が無かった場合
		else
			arr = ("a".."z").to_a + ("0".."9").to_a + ("A".."Z").to_a + ['.', '/']
			salt = ""
			2.times { salt += arr[rand(arr.length)] }
			cipher = session[:pass01].crypt(salt)
			@user = User.new(
				user_name: session[:user_name], 
				user_kana_name: session[:user_kana_name], 
				tel: session[:tel], 
				zip: session[:zip], 
				pref: session[:pref],
				addr01: session[:addr01],
				addr02: session[:addr02],
				email: session[:email],
				password: cipher
			)
			@user.save
		end
		render 'user/newAccount3'
	end

	def Existence
		session[:email] = params[:email]
		session[:tel] = params[:tel]
		session[:user_name] = params[:user_name]
		session[:user_kana_name] = params[:user_kana_name]
		session[:zip] = params[:zip]
		session[:pref] = params[:pref]
		session[:addr01] = params[:addr01]
		session[:addr02] = params[:addr02]
		session[:pass01] = params[:pass01]
		session[:pass02] = params[:pass02]
		# 既に登録がある場合
		if User.exists?(email: params[:email]) || User.exists?(tel: params[:tel]) || session[:pass01] != session[:pass02]
			if User.exists?(email: params[:email])
				session[:email_flg] = true
			end
			if User.exists?(tel: params[:tel])
				session[:tel_flg] = true
			end
			if session[:pass01] != session[:pass02]
				session[:pass_flg] = true
			end
			redirect_to :action => "NewAccount"
		# 登録が無かった場合
		else
			redirect_to :action => "NewAccount2"
		end
	end

	# ログイン時の処理
	def Login
		# メールアドレスで登録があるか確認
		@user = User.where(email: params[:email]).limit(1)
		if @user.present?
			@user.each do |user|
			  if params[:password].crypt(user.password) == user.password
			    session[:user] = user.user_name
			    redirect_to controller: 'photos', action: 'index'
			  else
			  	session[:login_flg] = true
			    redirect_to :action => "User"
			  end
			end
		# 登録がなかった場合 
		else
			session[:login_flg2] = true
			redirect_to :action => "User"
		end
	end

	def Logout
		session[:user] = nil
		redirect_to controller: 'photos', action: 'index'
	end
end

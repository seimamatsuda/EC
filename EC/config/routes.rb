Rails.application.routes.draw do
  get 'photos/index'
  get 'photos/ItemList'
  get 'photos/ItemListSearch'
  get 'photos/Category'

  get 'item/ItemDetail'

  get 'cart/Cart'
  post 'cart/DeleteCart'
  get 'cart/DeleteCart'
  get 'cart/ChangeNumber'
  get 'cart/CartConfirm'
  get 'cart/CartDone'
  
  get 'user/User'
  get 'user/NewAccount'
  get 'user/NewAccount2'
  get 'user/NewAccount2'
  get 'user/NewAccount3'
  post 'user/Existence'
  get 'user/Existence'
  post 'user/Login'
  get 'user/Logout'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

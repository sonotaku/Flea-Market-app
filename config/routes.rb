Rails.application.routes.draw do
  devise_for :users
  root to: 'orders#index'

  resources :orders
  # get 'orders/new', to: 'orders#calculate'
end

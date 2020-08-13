Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'

  resources :items, only: [:index, :new, :create]
  # get 'items', to: 'items#calculate'
end

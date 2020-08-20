Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'

  resources :items do
    member do
      get 'transactions'
      post 'purchase'
    end
  end
end

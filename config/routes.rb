Rails.application.routes.draw do
    
  devise_for :users
  root 'products#index'
  resources :products, only: :show do
    resources :reviews, only: [:new, :create]
  end
end

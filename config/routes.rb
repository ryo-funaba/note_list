Rails.application.routes.draw do
    
  devise_for :users
  root 'products#index'
  
  resources :users, only: :show
  resources :reviews, only: [:new, :create]
  resources :products, only: [:index, :show] do
    resources :reviews, only: [:edit, :update, :destroy]
    collection do
      get 'search'
    end
  end
  
end

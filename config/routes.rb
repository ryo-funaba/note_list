Rails.application.routes.draw do
    
  devise_for :users, controllers: { registrations: 'users/registrations' }
  root 'notes#index'
  
  resources :users, only: :show
  resources :reviews, only: [:new, :create]
  resources :notes, only: [:index, :show] do
    resources :reviews, only: [:edit, :update, :destroy]
    collection do
      get 'search'
    end
  end
  
end

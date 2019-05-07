Rails.application.routes.draw do
  get 'static_pages/index'
  get 'static_pages/secret'
  devise_for :users
  root 'events#index'
  # root 'static_pages#index'



  resources :events, only: [:index, :new, :create, :show]
  resources :users, only: [:show]
end

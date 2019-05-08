Rails.application.routes.draw do

  devise_for :users do
  get "/users/sign_out" => "devise/sessions#destroy", :as => :destroy_user_session
end
  root 'events#index'

  resources :events, only: [:index, :new, :create, :show]
  resources :users, only: [:show]
end

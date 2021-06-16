Rails.application.routes.draw do
  
  devise_for :users
  resources :books
  root to: 'books#index'
  resources :users, only: [:index, :show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

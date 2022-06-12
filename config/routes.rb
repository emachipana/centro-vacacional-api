Rails.application.routes.draw do
  resources :users
  resources :orders
  resources :clients
  resources :foods
  resources :rooms
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

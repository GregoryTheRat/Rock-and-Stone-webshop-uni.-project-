Rails.application.routes.draw do
  resources :delivers
  resources :orders
  resources :rates
  resources :advertises
  resources :carries
  resources :suppliers
  resources :adverts
  resources :users

  get '/logout', to: "home#destroy"
  get 'profile', to: "userdata#profile"
  post 'profile', to: "userdata#updateprofile"
  get 'home', to: "home#home"
  get 'login', to: "sessions#new"
  post 'login', to: "sessions#create"
  get 'newads', to: "newads#newads"

  get 'osszes', to: 'adverts#osszes'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root "home#home"
  # Defines the root path route ("/")
  # root "articles#index"
end

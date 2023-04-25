Rails.application.routes.draw do
  resources :delivers
  resources :orders
  resources :rates
  resources :advertises
  resources :carries
  resources :suppliers
  resources :adverts
  resources :users
  get 'userdata', to: "userdata#userdata"
  get 'home', to: "home#home"
  get 'signup', to: "signup#signup"
  get 'login', to: "login#login"
  get 'newads', to: "newads#newads"

  get 'osszes', to: 'adverts#osszes'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root "home#home"
  # Defines the root path route ("/")
  # root "articles#index"
end

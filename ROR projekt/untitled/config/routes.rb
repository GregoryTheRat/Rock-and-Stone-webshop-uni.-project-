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

  get 'osszes', to: 'adverts#osszes'
  get 'home/profilAdatok'
  get 'home/home'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root "home#home"
  # Defines the root path route ("/")
  # root "articles#index"
end

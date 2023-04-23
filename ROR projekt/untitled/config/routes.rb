Rails.application.routes.draw do
  get 'carries/index'
  get 'carries/show'
  get 'carries/new'
  get 'carries/edit'
  get 'carries/create'
  get 'carries/update'
  get 'carries/destroy'
  resources :delivers
  resources :orders
  resources :rates
  resources :advertises
  resources :suppliers
  resources :adverts
  #carries?
  resources :users
  get 'userdata', to: "userdata#userdata"
  get 'home', to: "home#home"
  get 'signup', to: "signup#signup"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root "home#home"
  # Defines the root path route ("/")
  # root "articles#index"
end

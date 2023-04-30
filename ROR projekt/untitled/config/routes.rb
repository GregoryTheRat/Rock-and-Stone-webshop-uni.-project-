Rails.application.routes.draw do
  resources :delivers
  resources :orders
  resources :rates
  resources :advertises
  resources :carries
  resources :suppliers
  resources :adverts
  resources :users

  get '/shop/:id', to: "shop#show", as: 'shop'
  post '/buy', to: "shop#buy"

  get '/logout', to: "home#destroy"
  get 'profile', to: "userdata#profile"
  post 'profile', to: "userdata#updateprofile"
  get 'home', to: "home#home"
  get 'login', to: "sessions#new"
  post 'login', to: "sessions#create"
  get 'newads', to: "newads#newads"
  get 'bag', to: "bag#bag"
  get '/search', to: 'home#search'
  get 'osszes', to: 'adverts#osszes'
  get '/delete',to: 'users#delete'
  get '/sajat',to: 'adverts#sajat'
  get '/all_users' ,to: 'users#all_users'
  delete '/adverts/:id', to: 'adverts#delete_advert', as: :delete_advert
  delete '/users/:id', to: 'users#delete_users', as: :delete_users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root "home#home"
  # Defines the root path route ("/")
  # root "articles#index"

end

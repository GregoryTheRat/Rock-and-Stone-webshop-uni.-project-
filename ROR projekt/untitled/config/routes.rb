Rails.application.routes.draw do
  resources :kiszallits
  resources :rendels
  resources :ertekels
  resources :hirdets
  resources :mitszallits
  resources :szallitos
  resources :hirdetes
  resources :felhasznalos
  get 'home/profilAdatok'
  get 'home/home'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root "home#home"
  # Defines the root path route ("/")
  # root "articles#index"
end

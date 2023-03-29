Rails.application.routes.draw do
  get 'home/profilAdatok'
  get 'home/home'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root "home#home"
  # Defines the root path route ("/")
  # root "articles#index"
end

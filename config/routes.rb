Rails.application.routes.draw do
 root 'static#home'


  get "/signin", to: "sessions#new"
  post "/sessions/create", to: "sessions#create"
  delete "/signout", to: "sessions#destroy"

  resources :users
  resources :attractions


  post "/rides/new", to: "rides#new", as: "new_ride"
end
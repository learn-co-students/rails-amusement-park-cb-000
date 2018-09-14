Rails.application.routes.draw do

  root 'static#home'

  resources :users
  get '/signin' => 'users#signin'
  post '/login' => 'users#login'
  get '/logout' => 'users#logout'

  resources :attractions

  post '/rides/new' => 'rides#new'
  # resources :rides

end

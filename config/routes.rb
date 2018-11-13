Rails.application.routes.draw do

  root 'attractions#home'

  get '/signin', to: 'sessions#new'
  post '/session/create', to: 'sessions#create'
  delete '/signout', to: 'sessions#destroy'

  post '/rides/new', to: 'rides#new'

  resources :users
  resources :attractions
end

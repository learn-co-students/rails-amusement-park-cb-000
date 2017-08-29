Rails.application.routes.draw do

  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  get '/signout', to: 'sessions#destroy'
  post '/rides/new', to: 'rides#new'
    
  resources :users
  resources :attractions
  # resources :rides

  root "pages#index"
end

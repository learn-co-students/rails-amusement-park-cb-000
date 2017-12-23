Rails.application.routes.draw do

  resources :users
  resources :attractions
  resources :rides

  post '/', to: 'sessions#create'
  get '/signin', to: 'sessions#new'
  get '/signout', to: 'sessions#destroy'

  root 'welcome#index'

end
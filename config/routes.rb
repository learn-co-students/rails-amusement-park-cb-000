Rails.application.routes.draw do
  get 'rides/create'

  root 'home#index'

  get '/signin', to: 'sessions#new'
  get '/signout', to: 'sessions#destroy'
  post '/signin', to: 'sessions#create'
  resources :users
  resources :attractions do
    resources :rides
  end
end

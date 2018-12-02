Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show]
  get '/signin', to: 'sessions#new'
  delete '/sessions', to: 'sessions#destroy'
  resources :sessions, only: [:create]
  resources :attractions
  resources :rides, only: [:create]

  root 'welcome#home'
end
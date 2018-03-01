Rails.application.routes.draw do
  root 'sessions#index'

  resources :users
  resources :attractions
  resources :sessions

  get '/signin' => "sessions#new"
  post '/ride' => 'users#ride'
end

Rails.application.routes.draw do

  resources :users, only: [:new, :create, :show]
  resources :attractions, only: [:index, :show]
  resources :rides, only: [:create]

  root 'welcome#home'

  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  delete '/signout' => 'sessions#destroy'

end

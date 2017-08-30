Rails.application.routes.draw do
 resources :users
 resources :attractions
 resource :sessions

 get '/signin', to: 'sessions#new'
 post '/signin', to: 'sessions#create'
 delete '/logout', to: 'sessions#destroy'
 get '/welcome/home', to: 'welcome#home'
 root 'welcome#home'
end

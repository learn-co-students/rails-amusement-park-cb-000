Rails.application.routes.draw do
 resource :users, only: [:index, :new, :create, :edit, :update]
 get '/users/:id', to: 'users#show'
 resource :sessions, only: [:create]

 get '/signin', to: 'sessions#new'
 get '/welcome/home', to: 'welcome#home'
 root 'welcome#home'
end

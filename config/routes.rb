Rails.application.routes.draw do

  root "welcome#welcome"
  resources :users
  get '/signin' => "sessions#new", :as =>  :sign_in
  resources :sessions, :only => [:create, :destroy]

  resources :attractions
  post '/attractions/go_on_ride/:id' => "attractions#go_on_ride", :as => :go_on_ride 
end

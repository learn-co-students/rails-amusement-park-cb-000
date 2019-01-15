Rails.application.routes.draw do

  devise_for :users
  resources :users
  root 'welcome#home'
end

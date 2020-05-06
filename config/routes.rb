Rails.application.routes.draw do
  
  root 'site#index'
  
  get 'users/new', to: 'users#new', as: :new_user_registration
  resources :users, only: [:show, :create] do
    post 'ride', on: :member
  end
  
  get 'signin', to: 'sessions#new', as: :new_user_session
  delete 'logout', to: 'sessions#destroy', as: :destroy_user_session
  resources :sessions, only: :create

  resources :attractions
end

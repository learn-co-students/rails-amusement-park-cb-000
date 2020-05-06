Rails.application.routes.draw do
  
  root 'site#index'
  get 'users/new', to: 'users#new', as: :new_user_registration
  resources :users, only: [:show, :create]
  get 'sign_in', to: 'sessions#new', as: :new_user_session
end

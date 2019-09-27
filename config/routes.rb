Rails.application.routes.draw do
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  root 'sessions#new'
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
end

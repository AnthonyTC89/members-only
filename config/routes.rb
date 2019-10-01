# frozen_string_literal: true

Rails.application.routes.draw do
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/signup', to: 'user#new'
  post '/signup', to: 'user#create'
  root 'posts#index'
  resources :user
  resources :sessions, only: %i[new create destroy]
  resources :posts, only: %i[new create index]
end

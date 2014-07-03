Rails.application.routes.draw do

  resource :sessions, only: [:new, :create, :destroy]
  get '/sign_in', to: 'sessions#new', as: 'sign_in'
  get '/sign_out', to: 'sessions#destroy', as: 'sign_out'

  get '/boards', to: 'ember#index', as: 'boards'
  get '/boards/:id', to: 'ember#index', as: 'board'

  namespace :api do
    resources :boards
    resources :users
    resources :items
  end

  root to: 'home#index'
  get '*path', to: 'ember#index'
end

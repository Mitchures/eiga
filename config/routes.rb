Rails.application.routes.draw do
  root to: 'home#index'

  resources :users, only: [:new, :show, :create]
  resources :sessions, only: [:new, :create, :destroy]

  get 'details/show'
  post 'add_to_watchlist', to: 'details#add_to_watchlist'
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  get 'search/show'
  get 'person/show'
end

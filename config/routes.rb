Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show]
  resources :sessions, only: [:create, :destroy]
  resources :attractions, except: [:destroy]
  resources :rides, only: [:create]

  get '/signin' => 'sessions#new', as: 'signin'
  get '/signout' => 'sessions#destroy', as: 'signout'
  root 'users#new'
end

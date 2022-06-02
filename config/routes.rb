Rails.application.routes.draw do
  root 'posts#index'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :users, only: [:show]
  resources :posts
  resources :relationships, only: [:index, :create, :destroy]
end

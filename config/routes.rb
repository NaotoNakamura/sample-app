Rails.application.routes.draw do
  root 'posts#index'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :users do
    resources :relationships, only: [:index, :create, :destroy]
  end
  resources :posts
end

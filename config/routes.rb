Rails.application.routes.draw do

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#delete'

  resources :posts, only: [:new, :create, :index] 


  root 'posts#index'
end

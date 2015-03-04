Rails.application.routes.draw do
  resources :songs

  resources :users

  get '/login', to: "sessions#new"

  post '/login', to:  "sessions#create"

  delete '/logout', to: "sessions#destroy"

  root to: "songs#index"
end

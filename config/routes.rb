Rails.application.routes.draw do
  resources :users do
    resources :tools, only: [:new, :create, :index]
  end

  resources :tools, only: [:show, :edit, :update, :destroy]

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end

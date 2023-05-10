Rails.application.routes.draw do
  # get 'dashboard/properties'
  # get 'dashboard/reports'
  devise_for :accounts
  #resources :properties

  # resources :properties do
  #   resources :favorites, only: [:create]
  # end
  # resources :favorites, only: [:destroy]

  resources :properties do
    post 'favorite', on: :member
    delete 'unfavorite', on: :member
    get 'favorite', on: :member
    get 'unfavorite', on: :member# add this line to define a route for GET requests to "/properties/:id/favorite"
  end

  resources :favorites, only: [:create, :index, :destroy]
  get '/favorites', to: 'favorites#index', as: 'favorite_index'
  post 'properties/:id/favorite', to: 'favorites#create', as: :property_favorite
  delete 'properties/:id/unfavorite', to: 'favorites#destroy', as: :property_unfavorite

  get "/dashboard" => 'dashboard#index', as: :dashboard
  get "/profile/:id" => 'dashboard#profile', as: :profile
  post "/agent/message" => "properties#email_agent", as: :email_agent
  post 'email_agent', to: 'messages#email_agent'
  get '/accounts', to: 'admin#index'
  # delete '/accounts/:id', to: 'accounts#destroy', as: 'account'
  delete '/accounts/:id', to: 'admin#destroy', as: :delete_account

  # resources :accounts, only: [:index, :show, :destroy]

  # namespace :admin do
  #   get "accounts", to: "admin#accounts", as: "accounts"
  #   delete "accounts/:id", to: "admin#destroy_account", as: "account"
  # end

  root to: 'public#main'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

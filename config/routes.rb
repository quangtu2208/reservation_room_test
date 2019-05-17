Rails.application.routes.draw do
  root "static_pages#home"

  get "/registration", to: "accounts#new"
  get "/profile", to: "accounts#show"
  get "/changepassword", to: "accounts#edit"
  get "/login", to: "sessions#new"

  post "/registration", to: "accounts#create"
  post "/login", to: "sessions#create"

  patch "/changepassword", to: "accounts#update"

  delete "/logout", to: "sessions#destroy"

  resources :account_activations, only: %i(edit)
  resources :password_resets, except: %i(show index destroy)

  resources :locations do
    resources :reviews, only: [ :create, :destroy]
    resources :rooms, only: %i(show)
  end

  resources :rooms do
    resources :reservation_details, only: [ :create ]
  end

  namespace :admin do
    resources :users do
      get "search", on: :collection
    end
    root "static_pages#home"
  end

  namespace :manager do
    root "static_pages#home"
    resources :rooms do
      get "search", on: :collection
    end
    resources :locations do
      get "search", on: :collection
      resources :reviews, only: [:show]
    end
  end
end

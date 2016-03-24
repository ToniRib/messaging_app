Rails.application.routes.draw do
  root to: "welcome#index"

  resources :users, only: [:new, :create]
  resources :conversations, only: [:show]

  get "/new_account", to: "users#new"
  get "/dashboard", to: "dashboard#show"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  get "/logout", to: "sessions#destroy"

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :messages, only: [:index]
    end
  end
end

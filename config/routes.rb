Rails.application.routes.draw do
  root to: "welcome#index"
  resources :users, only: [:new, :create]
  get "/new_account", to: "users#new"
  get "/dashboard", to: "dashboard#show"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
end

Rails.application.routes.draw do
  get "users/logout" => "sessions#destroy"

  get "/auth/:provider/callback", to: "sessions#create"
  root "sessions#index"

  resources :movies, only: ["new", "create", "show"]
end

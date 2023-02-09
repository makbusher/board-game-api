Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  post "/users" => "users#create"
  post "/sessions" => "sessions#create"

  get "/favorites" => "favorites#index"
  get "/favorites/:id" => "favorites#show"
  delete "/favorites/:id" => "favorites#destroy"

  get "/games" => "games#index"
  get "/games/:id" => "games#show"

  resources :games do
    resources :favorites, only: [:new, :create]
    resources :reviews
  end
end

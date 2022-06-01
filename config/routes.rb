Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "/actors/:id", controller: "actors", action: "show" # This is the URL segment parameter
  get "/actors", controller: "actors", action: "index"
  post "/actors", controller: "actors", action: "create"
  patch "/actors/:id", controller: "actors", action: "update"
  delete "actors/:id", controller: "actors", action: "destroy"
  # get "/actors", controller: "actors", action: "qshow"  # This is the query parameter
  # post "/actors", controller: "actors", action: "create" # This is the body parameter
  get "/movies", controller: "movies", action: "index"
  get "/movies/:id", controller: "movies", action: "show"
  post "/movies", controller: "movies", action: "create"
  patch "/movies/:id", controller: "movies", action: "update"
  delete "movies/:id", controller: "movies", action: "destroy"

  post "/users", controller: "users", action: "create"
  post "/sessions", controller: "sessions", action: "create"
end

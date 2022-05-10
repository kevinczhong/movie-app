Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "/actors/:id", controller: "actors", action: "show" # This is the URL segment parameter
  get "/actors", controller: "actors", action: "qshow"  # This is the query parameter
  post "/actors", controller: "actors", action: "create" # This is the body parameter
  get "/movies", controller: "movies", action: "index"
  get "/movies/:id", controller: "movies", action: "show"
end

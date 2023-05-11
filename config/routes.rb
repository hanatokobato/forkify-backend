Rails.application.routes.draw do
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end
  get "/health_check", to: "health_check#show"
  post "/graphql", to: "graphql#execute"
end

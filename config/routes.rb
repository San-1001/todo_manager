Rails.application.routes.draw do

  #get "todos", to: "todos#index"
  #post "todos", to: "todos#create"
  #get "todos/:id", to: "todos#show"
  get "/" => "home#index"
  resources :todos
  resources :users
  post "users/login", to: "users#login"
end

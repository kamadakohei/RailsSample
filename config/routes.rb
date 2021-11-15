Rails.application.routes.draw do
  root to: "tasks#index"
  resources :tasks
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # get "/tasks", to: "tasks#index"
  # post "/tasks", to: "tasks#create"
  # get "/tasks/new", to: "tasks#new", as: "new_task"
  # get "/tasks/:id/edit", to: "tasks#edit", as: "edit_task"
  # get "/tasks/:id", to: "tasks#show", as: "task"
  # patch "/tasks/:id", to: "tasks#update"
  # delete "/tasks/:id", to: "tasks#delete"
  get "/signup", to: "users#new"
  post "/signup", to: "users#create"
  get "/users/edit", to: "users#edit", as: "edit_user"
  patch "/users", to: "users#update", as: "user"
  get "/signin", to: "session#new"
  post "/signin", to: "session#create"
  get "/signout", to: "session#destroy"
end
 
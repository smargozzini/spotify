Rails.application.routes.draw do
  resources :songs
  resources :canciones
  root to: "welcome#show"

  resources :posts

  resources :users, only: [:destroy, :update]

  get "users/admin"
  get "users/profile"
  get 'users/:id/edit' => 'users#edit', as: :users_edit
  patch 'users/:id', controller: 'users', action: :update


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

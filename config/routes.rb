Rails.application.routes.draw do
  resources :articles, only: [:show, :index, :new, :create, :edit, :update, :destroy]
  get "signup", to: "users#new"
  resources :users, except: [:new]
end

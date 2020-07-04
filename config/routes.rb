Rails.application.routes.draw do
  devise_for :users
  root 'articles#index'
  resources :users, only: [:show]
  resources :articles do
    resources :comments, only: [:create]
  end
end
Rails.application.routes.draw do
  devise_for :users
  resources :livros

  root 'livros#index'
end

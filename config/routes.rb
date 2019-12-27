Rails.application.routes.draw do
  devise_for :users
  resources :livros do
    member do
      put "add", to: "livros#estante"
      put "del", to: "livros#estante"
    end
  end
  resources :estante, only: [:index]

  root 'livros#index'
end

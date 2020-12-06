Rails.application.routes.draw do
  devise_for :users
  root to: "posts#index"
  resources :users
  resources :posts do
    resources :comments, only: [:create, :destroy]
  end
end
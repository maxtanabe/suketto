Rails.application.routes.draw do
  get 'cards/new'
  devise_for :users, controllers: { registrations: 'users/registrations' }
  root to: "posts#index"
  resources :users
  resources :posts do
    resources :comments, only: [:create, :destroy]
    resources :thanks, only: [:new, :create]
    member do
      post :order
    end
  end
  resources :cards, only: [:new, :create]
end
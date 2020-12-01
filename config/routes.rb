Rails.application.routes.draw do
  devise_for :users
  get 'posts/index'
  root to: "posts#index"
end

Rails.application.routes.draw do
  get 'landing_page/index'
  resources :conversations
  resources :matches
  resources :user_game_stats
  devise_for :users
  resources :users
  root 'users#index'
end

Rails.application.routes.draw do
  resources :category, only: [:index]
  resources :discovery, only: [:index]
  resources :landing_page, only: [:index]
  resources :conversations
  resources :matches
  resources :user_game_stats
  devise_for :users
  resources :users
  root 'landing_page#index'
end

Rails.application.routes.draw do
  get 'category/index'
  get 'discovery/index'
  get 'landing_page/index'
  resources :conversations
  resources :matches
  resources :user_game_stats
  devise_for :users
  resources :users
  root 'landing_page#index'
end

Rails.application.routes.draw do
  resources :user_game_stats
  devise_for :users
  resources :users
  root 'users#index'
end

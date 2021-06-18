Rails.application.routes.draw do
  
  resources :conversations do
    resources :messages
  end
  resources :matches
  resources :user_game_stats
  devise_for :users
  resources :users
  root 'users#index'
end

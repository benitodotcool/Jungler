Rails.application.routes.draw do
<<<<<<< HEAD
  resources :messages
=======
  get 'category/index'
  get 'discovery/index'
  get 'landing_page/index'
>>>>>>> 35a5dbd5caa85f352424e5892aac4775533441af
  resources :conversations
  resources :matches
  resources :user_game_stats
  devise_for :users
  resources :users
  root 'landing_page#index'
end

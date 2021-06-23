Rails.application.routes.draw do
  resources :category, only: [:index]
  resources :discovery, only: [:index]
  resources :landing_page, only: [:index]  
  resources :conversations do
    resources :messages
  end
  resources :matches
  resources :user_game_stats
  devise_for :users
  resources :users
  root 'landing_page#index'

  get '/404' , to: 'errors#not_found'
  get '/422' , to: 'errors#unacceptable'
  get '/500' , to: 'errors#server_error'
end

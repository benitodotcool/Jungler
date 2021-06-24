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

  match '/404', via: :all, to: 'errors#not_found'
  match '/422', via: :all, to: 'errors#unprocessable_entity'
  match '/500', via: :all, to: 'errors#server_error'
end

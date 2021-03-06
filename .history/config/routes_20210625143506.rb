Rails.application.routes.draw do
  resources :category, only: [:index], path: 'Communaut√©'

  resources :discovery, path: "CGU", only: [:index]

  resources :landing_page, only: [:index] 

  resources :conversations, path: 'Messagerie' do
    resources :messages
  end

  resources :matches

  resources :user_game_stats, path: 'Stat'

  devise_for :users

  scope(path_names: { new: 'nouveau', edit: 'edition' }) do
    resources :users, path: 'Invocateurs'
  end

  root 'landing_page#index'

 
end

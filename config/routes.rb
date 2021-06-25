Rails.application.routes.draw do
  resources :category, only: [:index], path: 'Communauté'

  resources :discovery, path: "CGU", only: [:index]

  resources :landing_page, only: [:index], path: 'home' 

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

  match '/404', via: :all, to: 'errors#not_found'
  match '/422', via: :all, to: 'errors#unprocessable_entity'
  match '/500', via: :all, to: 'errors#server_error'

end
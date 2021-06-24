Rails.application.routes.draw do
  resources :category, only: [:index], path: 'Communauté'

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

<<<<<<< HEAD
  match '/404', via: :all, to: 'errors#not_found'
  match '/422', via: :all, to: 'errors#unprocessable_entity'
  match '/500', via: :all, to: 'errors#server_error'
=======
  get '/404' , to: 'errors#not_found'
  get '/422' , to: 'errors#unacceptable'
  get '/500' , to: 'errors#server_error'
>>>>>>> 223189ea3c306eaa65e98b84c5e821fe7048e027
end

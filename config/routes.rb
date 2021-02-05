Rails.application.routes.draw do

  root to: 'welcome#index'
  
  devise_for :users, controllers: {sessions: "users/sessions", registrations: "users/registrations", confirmations: 'users/confirmations' }
  
  resources :users, module: :users do
    get 'dashboard', to: 'dashboard#show'
    post 'friendships', to: 'friendships#create'
  end

  resources :discover, only: [:index]
  resources :movies, only: [:index, :show]
  resources :parties, only: [:new, :create]

  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
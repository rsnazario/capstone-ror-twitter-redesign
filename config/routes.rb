Rails.application.routes.draw do
  resources :users, only: [:new, :create, :index, :show]
  resources :opinions, only: [:new, :create, :index]
  post 'create_opinion', to: 'opinions#create'
  
  resources :followings, only: [:new, :create, :index, :destroy]
  resources :sessions, only: [:new, :create, :destroy]

  root 'sessions#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

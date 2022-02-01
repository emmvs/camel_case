Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  # CREATE
  get 'camels/new', to: 'camels#new'
  post 'camels', to: 'camels#create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

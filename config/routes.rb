Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/home', to: "pages#home"

  #INDEX

  # CREATE
  resources :camels do
    resources :bookings, only: [ :new, :create ]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :bookings, only: [ :edit, :update, :index ]
  # get 'camels/index', to: "camels#index"


end

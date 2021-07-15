Rails.application.routes.draw do
  devise_for :users
  root to: 'maintenances#calendar'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :equipment do
    resources :maintenances, only: [ :new, :create ]
  end
  resources :maintenances, only: [ :index, :edit, :update, :destroy]
  resources :external_interlocutors
  resources :users, only: :index

  get '/calendar', to: 'maintenances#calendar'
end

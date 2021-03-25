Rails.application.routes.draw do
  devise_for :users
  root to: 'equipment#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :equipment do
    resources :maintenances, only: [ :show, :new, :create ]
  end
  resources :maintenances, only: [ :index, :edit, :update, :destroy]
  resources :external_interlocutors
  resources :internal_interlocutors
  resources :users
end

Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :equipment do
    resources :maintenances, only: [:index, :new, :create, :show ]
  end
  resources :maintenances, only: [ :edit, :update, :destroy]
  resources :internal_interlocutors
  resources :external_interlocutors
  resources :users
end

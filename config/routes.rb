Rails.application.routes.draw do
  root to: 'users#index'
  resources :users, only: [:new, :create, :edit, :update, :show]
  resources :events, only: [:index, :new, :create, :edit, :update, :show]
  resources :user_sessions, only: [:new, :create, :destroy] 
  

  get 'login'  => 'user_sessions#new'
  get 'logout' => 'user_sessions#destroy'


end

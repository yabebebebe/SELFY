Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'users#index'
  resources :users do
    resources :successes, only: [:create, :edit, :update]
  end
  resources :users, only: [:show, :destroy]
  resources :successes, only: :show
end

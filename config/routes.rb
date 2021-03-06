Rails.application.routes.draw do
  devise_for :users
  root 'tops#index'
  resource :tops, only: :show
  resources :groups, only: [:new, :create, :edit, :update, :show, :destroy] do
    resources :messages, only: [:index, :create, :destroy]
    resource :messages, only: :edit
  end
  resources :users, only: :show
end

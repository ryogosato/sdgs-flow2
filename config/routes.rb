Rails.application.routes.draw do
  devise_for :users
  root 'tops#index'
  resource :tops, only: [:new, :show]
  resources :groups, only: [:new, :create, :edit, :update, :show] do
    resources :messages, only: [:index, :create, :destroy]
  end
end

Rails.application.routes.draw do
  devise_for :users
  root 'tops#index'
  resources :groups, only: [:new, :create, :edit, :update, :show] do
    resources :messages, only: [:index, :create, :destroy]
  end
end

Rails.application.routes.draw do
  devise_for :users
  root 'tops#index'
  resources :groups, only: [:index, :new, :create, :edit, :update, :show] do
    resources :messages, only: [:index, :edit]
  end
end

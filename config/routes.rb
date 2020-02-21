Rails.application.routes.draw do
  devise_for :users
  root 'messages#index'
  resources :messages do
    resources :groups, only: :index
  end
end

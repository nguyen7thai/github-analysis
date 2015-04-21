Rails.application.routes.draw do
  root 'repositories#index'

  resources :repositories, only: [:index, :show] do
    resources :commits, only: [:index]
  end

  resources :commits, only: [:show]

  resources :comments, only: [:index]
end

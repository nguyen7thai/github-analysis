Rails.application.routes.draw do
  root 'repositories#index'

  resources :repositories, only: [:index, :show] do
    resources :commits, only: [:index]
  end

  resources :commits, only: [:show] do
    resources :constructive_spams, only: [:create]
  end

  resources :comments, only: [:index]
end

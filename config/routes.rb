Rails.application.routes.draw do
  root 'sessions#new'

  resources :repositories, only: [:index, :show] do
    resources :commits, only: [:index]
  end

  resources :commits, only: [:show] do
    resources :constructive_spams, only: [:create]
  end

  resources :sessions, only: [:new, :create]

  resources :comments, only: [:index]

  resources :github_accounts

  namespace :api do
    namespace :v1 do
      resources :repositories, only: [:index]
      resources :sessions, only: [:create]
    end
  end
end

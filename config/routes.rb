Rails.application.routes.draw do
  root 'repositories#index'

  resources :repositories, only: [:index, :show]
  resources :comments, only: [:index]
end

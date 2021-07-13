Rails.application.routes.draw do
  root 'user#index'

  devise_for :users

  resources :user, only: %i[index show destroy]
  resources :admin
  get '/me', to: 'user#me'
  get '/edit', to: 'user#edit'
  put '/edit/:id', to: 'user#update'
end

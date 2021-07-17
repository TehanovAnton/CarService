Rails.application.routes.draw do
  root 'users#index'

  devise_for :users

  resources :users, only: %i[index show edit destroy]
  resources :errors, only: %i[index]
  get '/me', to: 'users#me'
  get '/edit', to: 'users#edit'
  put '/edit/:id', to: 'users#update'

  match '*path', to: 'errors#index', via: :all
end

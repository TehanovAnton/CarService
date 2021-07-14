Rails.application.routes.draw do
  root 'user#index'

  devise_for :users, controllers: { registrations: 'users/registrations' }

  resources :user, only: %i[index show destroy]
  resources :admin, only: %i[index edit update]
  resources :errors, only: %i[index]
  get '/me', to: 'user#me'
  get '/edit', to: 'user#edit'
  put '/edit/:id', to: 'user#update'

  match '*path', to: 'errors#index', via: :all
end

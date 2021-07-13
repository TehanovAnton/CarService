Rails.application.routes.draw do
  root 'user#index'

  devise_for :users

  resources :user, only: %i[index show destroy]
  resources :admin, only: %i[index edit update]
  get '/me', to: 'user#me'
  get '/edit', to: 'user#edit'
  put '/edit/:id', to: 'user#update'

  put '/create_admin', to: 'admin#create_admin'  
end

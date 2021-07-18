Rails.application.routes.draw do
  root 'users#index'

  devise_for :users

  resources :users, only: %i[index show edit destroy]
  get '/me', to: 'users#me'
  get '/edit', to: 'users#edit'
  put '/edit/:id', to: 'users#update'

  get '*path', to: 'errors#error_404', via: :all
end

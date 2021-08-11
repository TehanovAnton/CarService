Rails.application.routes.draw do
  root 'users#index'

  devise_for :users

  resources :users, only: %i[index show edit update destroy] do
    resources :service_orders
  end
  
  get '/me', to: 'users#me'
  get '/no_orders', to: 'users#no_orders'
  get '/fake', to: 'fakes#index'

  get '*path', to: 'errors#error_404', via: :all
end

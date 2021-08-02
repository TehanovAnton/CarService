Rails.application.routes.draw do
  root 'users#index'

  devise_for :users

  resources :users, only: %i[index show edit update destroy] do
    resources :service_orders
  end
  
  get '/me', to: 'users#me'
  get '/example', to: 'users#example'

  get '*path', to: 'errors#error_404', via: :all
end

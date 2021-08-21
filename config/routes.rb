Rails.application.routes.draw do
  root 'users#guest'

  devise_for :users

  resources :users, only: %i[index show edit update destroy guest] do
    resources :orders
  end
  
  get '/me', to: 'users#me'
  get '/no_orders', to: 'users#no_orders'
  get '/guest', to: 'users#guest'
  get '/mechanics', to: 'users#show_mechanics'
  get '/actual_orders', to: 'orders#show_actual_orders'
  get '/fake', to: 'fakes#index'
  get '/localization', to: 'fakes#example'
  get '/show_services', to: 'orders#show_services'

  get '*path', to: 'errors#error_404', via: :all
end

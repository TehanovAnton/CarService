# frozen_string_literal: true

Rails.application.routes.draw do
  root 'users#guest'

  devise_for :users

  resources :clients, only: %i[index show edit update destroy guest] do
    resources :orders
  end

  get '/me', to: 'clients#me'
  get '/no_orders', to: 'users#no_orders'
  get '/guest', to: 'clients#guest'
  get '/mechanics', to: 'users#show_mechanics'
  get '/actual_orders', to: 'orders#show_actual_orders'

  get '/fake', to: 'fakes#index'
  get '/example', to: 'fakes#example'
  post '/example_post', to: 'fakes#example_post'

  get '/show_services', to: 'orders#show_services'

  get '*path', to: 'errors#error_404', via: :all
end

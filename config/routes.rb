# frozen_string_literal: true

Rails.application.routes.draw do 

  scope ':locale', locale: /en|ru/ do
    root 'users#guest', locale: :ru

    devise_for :users

    resources :clients, only: %i[index show edit update destroy guest] do
      resources :orders
    end

    get '/no_orders', to: 'users#no_orders'
    get '/mechanics', to: 'users#show_mechanics'    

    get '/guest', to: 'clients#guest'
    get '/me', to: 'clients#me'

    get '/show_services', to: 'orders#show_services'
    get '/actual_orders', to: 'orders#show_actual_orders'

    get '/fake', to: 'fakes#index'
    get '/example', to: 'fakes#example'
    post '/example_post', to: 'fakes#example_post'

    get '*path', to: 'errors#error_404', via: :all
  end
end

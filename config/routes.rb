# frozen_string_literal: true

Rails.application.routes.draw do
  scope ':locale', locale: /en|ru/ do
    root 'users#guest', locale: I18n.locale

    devise_for :users, locale: I18n.locale

    resources :clients, only: %i[index show update destroy guest] do
      resources :orders
    end

    resources :users, only: %i[edit update]

    get '/no_orders', to: 'users#no_orders'
    get '/show_mechanics', to: 'users#show_mechanics'
    get '/show_teamates', to: 'users#show_teamates'

    get '/guest', to: 'clients#guest'
    get '/me', to: 'clients#me'

    get '/show_services', to: 'orders#show_services'
    get '/show_actual_orders', to: 'orders#show_actual_orders'

    get '/fake', to: 'fakes#index'
    get '/example', to: 'fakes#example'
    post '/example_post', to: 'fakes#example_post'

    get '*path', to: 'errors#error_404', via: :all
  end
end

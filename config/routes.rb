# frozen_string_literal: true

Rails.application.routes.draw do
  root '/en', controller: 'users', action: 'guest'

  scope ':locale', locale: /en|ru/ do
    devise_for :users, locale: I18n.locale

    resources :clients, only: %i[index show] do
      resources :orders
    end

    resources :users, only: %i[edit update destroy guest]

    get '/no_orders', to: 'users#no_orders'
    get '/show_mechanics', to: 'users#show_mechanics'
    get '/show_teammates', to: 'users#show_teammates'
    get '/forget_password', to: 'users#forget_password'
    get '/send_reset_password_instructions', to: 'users#send_reset_password_instructions'

    post '/search', to: 'users#search'

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

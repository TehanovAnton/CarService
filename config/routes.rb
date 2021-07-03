# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  resources :user, only: %i[index show destroy]
  get '/me', to: 'user#me'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

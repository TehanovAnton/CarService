# frozen_string_literal: true

Rails.application.routes.draw do
  get '/users', to: 'user#index'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

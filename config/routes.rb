# frozen_string_literal: true

Rails.application.routes.draw do
  get '/users', to: 'user#index'
  get '/users/:id', to: 'user#show'
  delete 'users/:id', to: 'user#delete'
  devise_for :users

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

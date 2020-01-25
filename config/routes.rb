# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'pages#index'

  namespace :api do
    namespace :v1 do
      resources :cards, only: %i[index]
      resources :categories, only: %i[index show]

      post 'user/token' => 'user_token#create'
      get 'users/current' => 'users#current'
    end
  end

  get '*path', to: 'pages#index', constraints: ->(req) { !req.xhr? && req.format.html? }
end

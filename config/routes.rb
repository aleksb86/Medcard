# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'pages#index'

  namespace :api do
    namespace :v1, defaults: { format: :json } do
      resources :cards, only: %i[index]
      resources :categories, only: %i[index show]

      post 'user/token' => 'user_token#create'
      resources :users
    end
  end

  get '*path', to: 'pages#index', constraints: ->(req) { !req.xhr? && req.format.html? }
end

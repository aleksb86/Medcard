# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'pages#home'

  resources :cards, only: [:index]
end

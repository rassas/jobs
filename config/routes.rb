# frozen_string_literal: true
Rails.application.routes.draw do
  resources :equipment
  resources :weapons, controller: :equipment, only: [:create, :update, :show, :destroy]
  resources :shields, controller: :equipment, only: [:create, :update, :show, :destroy]
  resources :equipment
  resources :characters
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'pages#index'
end

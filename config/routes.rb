# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  resources :users do
    resources :products
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'products#all'
  # get 'products', to: 'products#all'

  resources :products do
    resources :comments
  end
end

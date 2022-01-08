# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  resources :users do
    resources :products
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'products#index'
  get 'products/admin', to: 'products#admin'
post 'carts/add_to_cart/:id', to: 'carts#add_to_cart', as: 'carts_add_to_cart'
delete 'carts/remove_from_cart/:id', to: 'carts#remove_from_cart', as: 'remove_from_cart'  
resources :products do
    resources :comments
  end

 

end

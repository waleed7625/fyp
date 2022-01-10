# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  resources :users do
    resources :products
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'products#index'
  # checkout stripe
  scope '/checkout' do
    post 'create/:id', to: 'checkout#create', as: 'checkout_create'
    get 'cancel/:id', to: 'checkout#cancel', as: 'checkout_cancel'
    get 'success/:id', to: 'checkout#success', as: 'checkout_success'
  end
  get 'products/admin', to: 'products#admin', as: 'products_admin'
  post 'carts/add_to_cart/:id', to: 'carts#add_to_cart', as: 'carts_add_to_cart'
  delete 'carts/remove_from_cart/:id', to: 'carts#remove_from_cart', as: 'remove_from_cart'
  resources :products do
    resources :comments
  end
end

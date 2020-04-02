# coding: utf-8
Rails.application.routes.draw do

  root 'feed#index'
  resources :sessions, only: [:new, :create, :destroy]

  namespace :admin do
    resources :authors, except: [:index] do
      resources :posts
    end
  end

  get 'signup', to: 'admin/authors#new', as: 'signup'
  get 'login',  to: 'auth#new', as: 'login'
  get 'logout', to: 'auth#destroy', as: 'logout'
end

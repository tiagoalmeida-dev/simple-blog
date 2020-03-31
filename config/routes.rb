# coding: utf-8
Rails.application.routes.draw do

  root 'feed#index'

  namespace :admin do
    resources :sessions, only: [:new, :create, :destroy]

    resources :authors, except: [:index] do
      resources :posts
    end
  end

  get 'signup', to: 'admin/authors#new', as: 'signup'
  get 'login',  to: 'admin/sessions#new', as: 'login'
  get 'logout', to: 'admin/sessions#destroy', as: 'logout'
end

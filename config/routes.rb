# coding: utf-8
Rails.application.routes.draw do

  root 'home#index'

  resources :posts
  resources :authors, except: [:index]
  resources :sessions, only: [:new, :create, :destroy]

  get 'signup', to: 'authors#new', as: 'signup'
  get 'login',  to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
end

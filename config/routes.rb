# coding: utf-8
Rails.application.routes.draw do

  root 'posts#index'
  resources :sessions, only: [:new, :create, :destroy]
  resources :posts, only: [:index, :show], param: :slug
  resources :authors, only: [:show]

  namespace :admin do
    resources :authors, except: [:index] do
      resources :posts
    end
  end
 
  get 'signup', to: 'admin/authors#new', as: 'signup'
  get 'login',  to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
end

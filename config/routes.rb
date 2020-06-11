# frozen_string_literal: true

Rails.application.routes.draw do

  root to: "tests#index"

  resources :tests do
    resources :questions

    member do
      post :start
    end
  end

  resources :test_passages, only: %i[show update] do
    member do
      get :result
    end
  end

  resources :users, only: :create
  resources :sessions, only: :create

  get :signup, to: 'users#new'
  get :login, to: 'sessions#new'
  get :signout, to: 'sessions#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

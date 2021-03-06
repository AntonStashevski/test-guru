# frozen_string_literal: true

Rails.application.routes.draw do

  devise_for :users, path: :gurus, path_names: { sign_in: :login, sign_out: :logout }, :controllers => {:registrations => "users/registrations"}

  authenticated :user do
    root to: "application#index"
  end

  root to: "tests#index"

  resources :tests, only: :index do
    resources :questions do
      resources :answers, shallow: true
    end

    member do
      post :start
    end
  end

  resources :test_passages, only: %i[show update] do
    member do
      get :result
      post :gist
    end
  end

  namespace :admin do
    resources :tests do
      patch :update_inline, on: :member
      resources :questions do
        resources :answers, shallow: true
      end
    end
    resources :gists, only: :index
    resources :badges
  end

  resources :feedback, only: %i[new create]

  resources :badges, only: %i[index]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

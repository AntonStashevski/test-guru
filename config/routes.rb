# frozen_string_literal: true

Rails.application.routes.draw do

  devise_for :users, path: :gurus, path_names: { sign_in: :login, sign_out: :logout }

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

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

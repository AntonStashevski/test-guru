# frozen_string_literal: true

Rails.application.routes.draw do

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

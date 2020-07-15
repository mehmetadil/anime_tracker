# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root 'animes#index'

  resources :animes, only: %i[index show] do
    get :search, on: :collection
  end
end

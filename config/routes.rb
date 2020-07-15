# frozen_string_literal: true

Rails.application.routes.draw do
  root 'animes#index'
  resources :animes, only: %i[index show]
end

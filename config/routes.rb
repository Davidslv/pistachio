# frozen_string_literal: true

Rails.application.routes.draw do
  resources :postcode_searches, only: %i[new create]

  namespace :admin do
    resources :allowed_areas
    resources :allowed_postcodes
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root 'postcode_searches#new'
end

# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    confirmations: 'users/confirmations',
  }

  authenticated :user do
    root 'home#index', as: :authenticated_root
  end

  root 'home#index'
end

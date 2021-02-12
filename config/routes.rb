# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  authenticated :user do
    root 'home#index', as: :authenticated_root
  end

  root 'home#index'
end

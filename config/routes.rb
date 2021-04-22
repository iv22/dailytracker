# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    confirmations: 'users/confirmations'
  }

  authenticated :user do
    root 'home#index', as: :authenticated_root
  end

  root 'home#index'

  ActiveAdmin.routes(self)

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :employees, except: [:new, :edit]
      post 'employees/upload', to: 'employees#upload'
      post 'employees/:id/lock', to: 'employees#lock'
      post 'employees/:id/unlock', to: 'employees#unlock'
      post 'invitation/:id', to: 'invitation#create', as: 'invitation'
    end
  end

  match '*path', to: 'home#index', via: :all
end

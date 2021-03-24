# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'invitation/create'
    end
  end
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
      post 'invitation/:id', to: 'invitation#create'
    end
  end

  match '*path', to: 'home#index', via: :all
end

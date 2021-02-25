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

  ActiveAdmin.routes(self)

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      get "/employees/current", to: "employees#current"
      resources :employees , except: [:new, :edit]      
    end
  end
end

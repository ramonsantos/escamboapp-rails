# frozen_string_literal: true

Rails.application.routes.draw do
  post '/rate' => 'rater#create', :as => 'rate'
  get 'backoffice', to: 'backoffice/dashboard#index'

  namespace :backoffice do
    resources :send_mail,  only: [:edit, :create]
    resources :categories, except: [:show, :destroy]
    resources :admins,     except: [:show]
    get 'dashboard', to: 'dashboard#index'
  end

  namespace :site do
    get 'home',   to: 'home#index'
    get 'search', to: 'search#ads'

    namespace :profile do
      resources :dashboard, only: [:index]
      resources :ads,       only: [:index, :edit, :update, :new, :create]
      resources :my_data,   only: [:edit, :update]
    end

    resources :ad_details, only: [:index, :show]
    resources :categories, only: [:show]
    resources :comments,   only: [:create]
  end

  devise_for :admins,  skip: [:registrations]
  devise_for :members, controllers: {
    sessions: 'members/sessions',
    registrations: 'members/registrations'
  }

  root 'site/home#index'
end

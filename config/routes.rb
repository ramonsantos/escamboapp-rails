Rails.application.routes.draw do
  get 'backoffice', to: 'backoffice/dashboard#index'

  namespace :backoffice do
    get 'home', to: 'home#index'
    resources :categories, expect: [:show, :destroy]
  end

  devise_for :admins
  devise_for :members

  root to: 'site/home#index'
end

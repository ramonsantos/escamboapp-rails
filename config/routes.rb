Rails.application.routes.draw do
  namespace :site do
    get 'home', to: 'home#index'
  end

  get 'backoffice', to: 'backoffice/dashboard#index'

  devise_for :admins
  devise_for :members

  root to: 'site/home#index'
end

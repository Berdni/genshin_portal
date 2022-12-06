require 'sidekiq/web'

Rails.application.routes.draw do
  devise_for :users
  root 'static_pages#home'

  namespace :admin do
    resources :users
    resources :heroes

    root to: 'users#index'
  end

  mount Sidekiq::Web => '/sidekiq'
end

Rails.application.routes.draw do
  namespace :admin do
      resources :users

      root to: "users#index"
    end
  devise_for :users
  root 'static_pages#home'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

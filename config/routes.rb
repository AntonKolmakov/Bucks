require 'sidekiq/web'

Rails.application.routes.draw do
  mount ActionCable.server => '/cable'
  mount Sidekiq::Web => '/jobs'

  devise_for :users
  root 'dashboard#index'

  namespace :api do
    namespace :frontend do
      resources :exchange_rates, only: :create
    end
  end
end

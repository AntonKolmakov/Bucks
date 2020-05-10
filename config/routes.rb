require 'sidekiq/web'

Rails.application.routes.draw do
  mount ActionCable.server => '/cable'
  mount Sidekiq::Web => '/jobs'

  devise_for :users
  root 'dashboard#index'
end

Rails.application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'

  # given week
  # /api/v1/weeks/weeks/:id

  # all disbursements for all weeks
  # /api/v1/weeks/weeks/

  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      scope :disbursements do
        resources :weeks, only: [:index, :show]
      end
    end
  end
end
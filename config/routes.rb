Rails.application.routes.draw do
  root to: 'authors#index'

  resources :publishers
  resources :books
  resources :authors

  namespace :api do
    namespace :v1, defaults: {format: :json} do

    end
  end
end

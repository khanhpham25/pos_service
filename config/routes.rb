Rails.application.routes.draw do
  namespace :api, defaults: { format: JSON }  do
    namespace :v1 do
      post 'login', to: 'authentications#create'

      resources :users
      resources :products
      resources :categories
      resources :receipts
      resources :statistic_reports, only: :index
    end
  end
end

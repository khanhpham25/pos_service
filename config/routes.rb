Rails.application.routes.draw do
  namespace :api, defaults: { format: JSON }  do
    namespace :v1 do
      post 'login', to: 'authentications#create'

      resources :users
      resources :products do
        collection do
          delete :delete_products
          put :allow_selling_products
          put :stop_selling_products
        end
      end
      resources :customers
      resources :categories
      resources :receipts
      resources :statistic_reports, only: :index

      namespace :exports do
        resources :products, only: [] do
          collection do
            get :import_template
          end
        end
      end
    end
  end
end

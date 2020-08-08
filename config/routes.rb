Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :stockitems do
        collection do
          put 'add_quantities_of_product/:product_id', to: 'stockitems#add_quantities_of_product'
          put 'lower_quantities_of_product/:product_id', to: 'stockitems#lower_quantities_of_product'
        end
      end
      resources :stores
      resources :products
    end
  end
end

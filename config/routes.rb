Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :stockitems do
        collection do
          put 'add/:product_id', to: 'stockitems#add'
          put 'lower/:product_id', to: 'stockitems#lower'
        end
      end
      resources :stores
      resources :products
      get 'info', to: 'info#info'
    end
  end
end

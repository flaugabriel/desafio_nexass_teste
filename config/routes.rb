Rails.application.routes.draw do
  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      resources :stockitems
      resources :stores
      resources :products
    end
  end
end

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'controls#index'
  resources :controls
  resources :appointtps
  resources :productdefs
  resources :intentions do
    resources :appoints
    resources :transcustomers do
      collection do
        get 'getcity'
        get 'getdistrict'
      end
    end
    collection do
      get 'getcity'
      get 'getdistrict'
    end
  end
  resources :industries
  resources :transcustomers
  resources :customers do
    resources :products do
      collection do
        get 'getproduct'
      end
    end
    resources :customerappoints
    collection do
      get 'getcity'
      get 'getdistrict'
    end
    resources :pacts
  end
  resources :followappoints
  resources :followcustomerappoints
  resources :serviceends
  resources :users
  resources :apis do
    collection do
      get 'getintentionlist'
      get 'test'
      get 'getaccesstoken'
    end
  end
  resources :customertypes
  resources :pacttypes
end

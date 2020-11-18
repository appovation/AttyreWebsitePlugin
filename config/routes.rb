Rails.application.routes.draw do
  root :to => 'home#index'
  mount ShopifyApp::Engine, at: '/'

  get 'orders_create', to: 'webhook#orders_create'
  post 'orders_create', to: 'webhook#orders_create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

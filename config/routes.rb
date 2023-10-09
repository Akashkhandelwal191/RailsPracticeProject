Rails.application.routes.draw do
  
  require 'sidekiq/web' 
  mount Sidekiq::Web => '/sidekiq' 

  get 'payments/:id/paymentsuccess' => 'payments#paymentsuccess'
  get 'payments/paymentfailed' => 'payments#paymentfailed'
  get 'payments/:id/pay' => 'payments#pay'
  get 'payments/payment_receipt'
  get 'orders/processorder'
  get 'orders/:id/buildorder' => 'orders#buildorder',as: :buildorder
  get 'products/:id/buynow' => 'products#buynow',as: :buynow
  resources :orders
  
  get 'carts/:id/add_product_to_cart' => 'carts#add_product_to_cart',as: :add_product_to_cart
  get 'carts/:id/remove_product_from_cart' => 'carts#remove_product_from_cart',as: :remove_product_from_cart
  
  get 'line_items_products/index'
  get 'line_items_products/:id/increment' => 'line_items_products#increment',as: :increment
  get 'line_items_products/:id/decrement' => 'line_items_products#decrement',as: :decrement

  resources :addresses
  resources :carts
  # get 'wish_lists/index'
  # get 'wish_lists/show'
  get 'wish_lists/:id/additem'=> 'wish_lists#additem',as: :additem

  resources :wish_lists
  # resources :reviews
  # resources :products
  resources :categories
  
  root "homes#index"
 
  get 'homes/index'
  get 'homes/show'
  get 'homes/search' 

  resources :products do
    resources :reviews, only: [:new, :create]
  end
  
  devise_for :users, :controllers => {:registrations => "users/registrations"}
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end



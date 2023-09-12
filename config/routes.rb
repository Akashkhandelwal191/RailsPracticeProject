Rails.application.routes.draw do
  resources :carts
  # get 'wish_lists/index'
  # get 'wish_lists/show'
  get 'wish_lists/:id/additem'=> 'wish_lists#additem',as: :additem

  resources :wish_lists
  resources :reviews
  resources :products
  resources :categories
  
  root "homes#index"
 
  get 'homes/index'
  get 'homes/show'
  devise_for :users, :controllers => {:registrations => "users/registrations"}
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

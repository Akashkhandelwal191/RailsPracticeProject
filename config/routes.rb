Rails.application.routes.draw do
  
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

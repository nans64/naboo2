Rails.application.routes.draw do
  resources :products
  devise_for :users
  resources :products do
    resources :carts
  end
  resources :charges
  
  get 'home/users'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "products#index"
end

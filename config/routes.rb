Rails.application.routes.draw do
  resources :line_items
  resources :carts
  get 'store/index'
  resources :products
  get 'salary/basic'
  get 'salary/hra'
  get 'salary/internet_allowance'
  get 'salary/pf'
  get 'welcome/index'
  root 'store#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

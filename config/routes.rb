Rails.application.routes.draw do
  resources :products
  get 'salary/basic'
  get 'salary/hra'
  get 'salary/internet_allowance'
  get 'salary/pf'
  get 'welcome/index'
  root 'welcome#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

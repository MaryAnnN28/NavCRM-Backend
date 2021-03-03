Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # root 'pages#index'

  resources :users
  resources :customers
  resources :tasks
  # get '*path', to: 'pages#index', via: :all

  # root 'pages#index'

  # resources :users
  # get 'customers', to: 'site#index'
  # get 'customers/new', to: 'site#index', 
  # get 'customers/:id', to: 'site#index'
  # resources :tasks
 
end

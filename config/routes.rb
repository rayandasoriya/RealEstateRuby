Rails.application.routes.draw do
  resources :potential_buyers
  resources :queries
  resources :properties
  resources :companies
  devise_for :users
  match '/user/new', to: 'users#new', via: 'get'
  match '/user/create', to: 'users#create', via: 'post'
  match '/users', to: 'users#index', via: 'get'
  match '/hunters', to: 'users#hunter', via: 'get'
  match '/realtors', to: 'users#realtor', via: 'get'
  root to: "house_rental_app#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

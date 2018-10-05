Rails.application.routes.draw do
  resources :potential_buyers
  resources :queries
  resources :properties
  resources :companies
  devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks" }

  match '/user/new', to: 'users#new', via: 'get'
  match '/user/create', to: 'users#create', via: 'post'
  match '/user/:id/edit', to: 'users#edit', via: 'get', as: 'user_edit'
  match '/user/:id', to: 'users#update', via: 'put'
  match '/user/:id', to: 'users#update', via: 'patch'
  match '/user/:id', to: 'users#destroy', via: 'delete'
  match 'users/:id' => 'users#destroy', :via => :delete, :as => :admin_destroy_user

  # Routes for Property Search
  match '/property/search' => 'properties#search', :via => 'post', :as=> 'property_search'

  match '/users', to: 'users#index', via: 'get'
  match '/hunters', to: 'users#hunter', via: 'get'
  match '/realtors', to: 'users#realtor', via: 'get'
  root to: "real_estate_app#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

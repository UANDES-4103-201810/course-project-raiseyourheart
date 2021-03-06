Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: {:omniauth_callbacks => 'callbacks'}
  root "static_pages#index"

  get "/about", to: "static_pages#about", as: "about"
  get "/contact", to: "static_pages#contact", as: "contact"
  post "/static_pages/thank_you"
  resources :categories
  resources :user_buy_promises
  resources :wishlists
  resources :promises
  resources :goods
  resources :project_data
  resources :media
  resources :projects do
    resources :user_fund_projects
  end
  resources :users

  post "/user_buy_promises" => "user_buy_promises#create", as: "buy_promise_path"

  get '/:token/confirm_email/', :to => "user_fund_projects#confirm_email", as: 'confirm_email'

  get '/:token/confirm_promise/', :to => "user_buy_promises#confirm_promise", as: 'confirm_promise'

  #get 'user/:id/projects' => 'projects#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

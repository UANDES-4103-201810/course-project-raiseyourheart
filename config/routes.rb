Rails.application.routes.draw do
  devise_for :users
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

  #get 'user/:id/projects' => 'projects#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

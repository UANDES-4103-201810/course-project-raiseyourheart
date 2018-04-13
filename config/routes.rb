Rails.application.routes.draw do
  resources :user_buy_promises
  resources :user_fund_projects
  resources :wishlists
  resources :promises
  resources :goods
  resources :project_data
  resources :media
  resources :projects
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

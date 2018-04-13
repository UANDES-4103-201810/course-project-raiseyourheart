Rails.application.routes.draw do
  resources :project_data
  resources :media
  resources :projects
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

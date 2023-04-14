Rails.application.routes.draw do
  devise_for :users
  root to: "customers#index"

  resources :customers do
    resources :conversations
    delete "delete_all", to: "conversations#delete_all" 
    resources :works
  end
  
end

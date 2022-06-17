Rails.application.routes.draw do
  resources :schools
  resources :provinces
  resources :areas
  get 'home/index'
  devise_for :users

  root to: "home#index"

end

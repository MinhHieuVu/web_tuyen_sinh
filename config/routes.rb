Rails.application.routes.draw do

  devise_for :users,
             path: '',
             path_names: { sign_in: 'dang-nhap', sign_out: 'dang-xuat', sign_up: 'dang-ky' }

  root to: "home#index"
  get ':school_id', to: 'home#index'

  namespace :admin do
    resources :school_infos
    resources :schools
    resources :provinces
    resources :areas
  end

end

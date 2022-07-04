Rails.application.routes.draw do

  devise_for :users,
             path: '',
             path_names: { sign_in: 'dang-nhap', sign_out: 'dang-xuat', sign_up: 'dang-ky' }

  root to: "home#index"
  get ':school_id',to: 'home#index' , as: 'school_index'
  get ':school_info_id' , to: 'home#index', as: "school_info_index"
  get ':area_id' , to: 'home#index', as: "area_index"
  get ':province_id' , to: 'home#index', as: "province_index"


  namespace :admin do
    resources :school_infos
    resources :schools
    resources :provinces
    resources :areas
    get 'dashboard/index'
  end

end

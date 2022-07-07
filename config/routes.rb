Rails.application.routes.draw do

  devise_for :users,
             path: '',
             path_names: { sign_in: 'dang-nhap', sign_out: 'dang-xuat', sign_up: 'dang-ky' }

  root to: "home#index"
  get ":id", to: "schools#show", as: :school
  resources :school_infos, path: 'loai-hinh'
  resources :areas, path: 'khu-vuc'
  resources :provinces, path: 'tinh-tp' do
    resources :school_infos, path: 'loai-hinh'
  end


  namespace :admin do
    resources :school_infos
    resources :schools
    resources :provinces
    resources :areas
    get 'dashboard/index'
  end

end
